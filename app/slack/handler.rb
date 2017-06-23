module Bloo::Slack
  class Handler
    class << self
      def perform(message)
        case message[:category]
        when "Identification"
          user = create_user(message)
          "Ok, you are #{user.device}"
        when "Greeting"
          "Bonsoir #{message[:user_name]}."
        else
          "I'm sorry, I couldn't understand that."
        end
      end

      private

      def create_user(message)
        device_addr = message[:text].split("i am").last.strip

        User.create(username: message[:user_name], device: device_addr)
      end
    end
  end
end
