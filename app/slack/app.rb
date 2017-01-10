module Emilie
  class App < Sinatra::Base
    use Slack::Middleware

    post "/slack" do
      reply = Emilie::Slack::Handler.perform(params)
      { text: reply }.to_json
    end
  end
end
