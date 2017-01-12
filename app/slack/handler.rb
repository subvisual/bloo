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
        identify_users Bloo::Atmos::Office.users
      end

      def identify_users(users)
        users.
          map { |user| user[:first_name] << " " << user[:last_name] }.
          join(", ")
      end

      def own_name
        Bloo.config[:slack][:name]
      end
    end
  end
end
