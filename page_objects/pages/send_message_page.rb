module PageObjects
  module Pages
    class SendMessagePage < SitePrism::Page
      element :close,       'div.muDialog--close'
      element :body,        '#messaging-new-convo'
      element :send_button, '#messaging-new-send'
    end
  end
end