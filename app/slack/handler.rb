module Bloo::Slack
  class Handler
    class << self
      def perform(message)
        case message[:category]
        when "Greeting"
          "Bonsoir #{message[:user_name]}."
        else
          "I'm sorry, I couldn't understand that."
        end
      end
    end
  end
end
