module PageObjects
  module Pages
    class LoginPage < SitePrism::Page
      set_url "https://secure.meetup.com/login/"

      element :email,        '#email'
      element :password,     '#password'
      element :remember_me,  '#rememberme'
      element :login_button, "input[type='submit'][value='Log in']"
    end
  end
end