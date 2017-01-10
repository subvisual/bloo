module Bloo::Slack
  class Handler
    class << self
      def perform(message)
        case message[:text]
        when /^hi #{own_name}/i
          "Bonjour #{message[:user_name]}"
        end
      end

      private

      def own_name
        Bloo.config[:slack][:name]
      end
    end
  end
end
