module PageObjects
  module Pages
    class MembersPage < SitePrism::Page
      set_url "http://www.meetup.com{/meetup_name}/members/{?query*}"

      elements :message_links, 'div.memberActions a.j-composeNewMessage'
      element  :num_of_members, "div#C_document li.selected span.D_count"

      def number_of_members
        num_of_members.text.gsub(/[()]/, '').to_i
      end
    end
  end
end