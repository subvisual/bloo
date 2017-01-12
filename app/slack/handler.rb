module Bloo::Slack
  class Handler
    class << self
      def perform(message)
        case message[:category]
        when "Greeting"
          "Bonsoir #{message[:user_name]}."
        when "Office"
          "Well, I see #{online_users}."
        else
          "I'm sorry, I couldn't understand that."
        end
      end

      private

      def online_users
        identify_users Bloo::Atmos::Office.users
      end

      def identify_users(users)
        users.
          map { |user| full_name(user) }.
          join(", ")
      end

      def full_name(user)
        user[:first_name] << " " << user[:last_name]
      end

      def own_name
        Bloo.config[:name]
      end
    end
  end
end
