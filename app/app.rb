module Bloo
  class App < Sinatra::Base
    get "/" do
      "Hello, world!"
    end

    private

    def classifier
      Bloo::Classifier.instance
    end

    def satellite
      Bloo::Satellite.instance
    end
  end
end
