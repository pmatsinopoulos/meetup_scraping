module PageObjects
  class Application
    def initialize
      @pages = {}
    end

    def meetup
      @pages[:meetup] ||= PageObjects::Pages::MeetupPage.new
    end

    def login_page
      @pages[:login_page] ||= PageObjects::Pages::LoginPage.new
    end

    def logout_page
      @pages[:logout_page] ||= PageObjects::Pages::LogoutPage.new
    end

    def send_message_page
      @pages[:send_message_pat] ||= PageObjects::Pages::SendMessagePage.new
    end

    def login(email_address, password)
      meetup.login_link.click

      login_page.wait_until_email_visible(20)

      login_page.email.set email_address

      login_page.password.set password

      login_page.remember_me.click

      login_page.login_button.click

      sleep(10)
    end

    def logout
      logout_page.load
    end

    def members
      @pages[:members] ||= PageObjects::Pages::MembersPage.new
    end
  end
end

