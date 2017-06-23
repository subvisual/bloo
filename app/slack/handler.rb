module Bloo::Slack
  class Handler
    class << self
      def perform(message)
        case message[:text]
        when /i am/
          user = create_user(message)
          if user
            "Ok, you are #{user.device}"
          else
            "I couldn't save your data. Maybe you have already registered?"
          end
        when /whos at the office/
          users = online_users
          if users.empty?
            "Well, I don't see anyone here"
          else
            "Well, I see #{users.map(&:username).join(", ")}"
          end
        end
      end

      private

      def create_user(message)
        device_addr = message[:text].split("i am").last.strip

        begin
          User.create(username: message[:user_name], device: device_addr)
        rescue ActiveRecord::RecordNotUnique
          nil
        end
      end

      def online_users
        satellite.online_devices.inject([]) do |acc, dev|
          user = User.find_by(device: dev[:mac_addr])
          user ? acc << user : acc
        end
      end

      def satellite
        Bloo::Satellite.instance
      end
    end
  end
end
