module Bloo
  class App < Sinatra::Base
    get "/" do
      "Hello, world!"
    end

    private

    def classifier
      Bloo::Classifier.instance
    end
  end
end
