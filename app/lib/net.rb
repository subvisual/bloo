module Bloo
  class Net
    class << self
      def get(endpoint, params = {})
        HTTParty.get(endpoint, query: params).deep_symbolize_keys
      end
    end
  end
end
