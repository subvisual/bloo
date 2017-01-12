module Bloo::Slack
  class Handler
    class << self
      def perform(message)
        case message[:text]
        when /^hi #{own_name}/i
          "Bonjour #{message[:user_name]}"
        when /who['’]?s at the office\??/i, /@office/i
          online_users
        end
      end

      private

      def online_users
        tag_users Bloo::Atmos::Office.users
      end

      def tag_users(users)
        users.
          map { |user| tag_or_identify(user) }.
          join(", ")
      end

      def tag_or_identify(user)
        if user[:slack_username]
          "<@#{user[:slack_username]}>"
        else
          user[:first_name] << " " << user[:last_name]
        end
      end

      def own_name
        Bloo.config[:slack][:name]
      end
    end
  end
end
