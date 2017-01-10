module Bloo
  class App < Sinatra::Base
    use Slack::Middleware

    post "/slack" do
      reply = Bloo::Slack::Handler.perform(params)
      { text: reply }.to_json
    end
  end
end
