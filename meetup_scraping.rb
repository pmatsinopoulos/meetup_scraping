require "capybara"

Capybara.default_driver = :selenium

require 'capybara/dsl'
require 'site_prism'

$LOAD_PATH << File.expand_path("..", __FILE__)

require 'page_objects/pages/meetup_page'
require 'page_objects/pages/login_page'
require 'page_objects/pages/members_page'
require 'page_objects/pages/logout_page'
require 'page_objects/pages/send_message_page'
require 'page_objects/application'


email_address   = ARGV[0].chomp
password        = ARGV[1].chomp
meetup_name     = ARGV[2].chomp
message_to_send = ARGV[3].chomp

@app = PageObjects::Application.new
@app.meetup.load

@app.login email_address, password

@app.members.load meetup_name: meetup_name

# http://www.meetup.com/Startup-Grind-Athens/members/?offset=20&desc=1&sort=social_sort

offset = 0
desc   = 1
sort   = 'social_sort'
paging = 20

current = 0

while current < @app.members.number_of_members - 1 # -1 to exclude ourselves from member list

  @app.members.message_links.each do |message_link|
    message_link.click
    current += 1
    sleep(1)
  end

  unless message_to_send.empty?
    @app.send_message_page.body.set message_to_send
    @app.send_message_page.send_button.click

    sleep(1)
  end

  offset += paging
  @app.members.load meetup_name: meetup_name, query: {offset: offset, desc: desc, sort: sort}

  sleep(1)
end

@app.logout

sleep(10)