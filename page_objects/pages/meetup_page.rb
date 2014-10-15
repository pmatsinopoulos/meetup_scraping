module PageObjects
  module Pages
    class MeetupPage < SitePrism::Page
      set_url "http://www.meetup.com"

      element :login_link, "ul#C_userLinks a[href='https://secure.meetup.com/login/']"
    end
  end
end