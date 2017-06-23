require "singleton"

module Bloo
  class Satellite
    include Singleton

    def initialize
      @antenna = ::Satellite::Antenna.new(config[:host], config[:port])
    end

    def online_devices
      return [] unless data
      data.online_devices
    end

    def liftoff
      define_callbacks
      antenna.watch
    end

    private

    attr_reader :antenna, :data

    def define_callbacks
      antenna.on("data") { |data| @data = data }
    end

    def config
      Bloo.config[:satellite]
    end
  end
end
