module Emilie
  class App < Sinatra::Base
    include Emilie

    get "/" do
      "Hello, world!"
    end
  end
end
