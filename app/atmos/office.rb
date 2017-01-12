module Bloo::Atmos
  class Office
    ATMOS_API_URL = "http://atmos.sbvsl.com/api/v1".freeze
    OFFICE_ENDPOINT = "/office".freeze
    TOKEN = Bloo.config[:atmos][:token].freeze

    class << self
      def users
        Bloo::Net.get(url(OFFICE_ENDPOINT), token: TOKEN)[:data][:users]
      end

      private

      def url(endpoint)
        "#{ATMOS_API_URL}/#{endpoint}"
      end
    end
  end
end
