module Bloo
  class App < Sinatra::Base
    use Slack::Middleware

    post "/slack" do
      reply = Bloo::Slack::Handler.perform(slack_params)
      { text: reply }.to_json
    end

    private

    def slack_params
      params.merge(category: message_category)
    end

    def message_category
      classifier.classify(params[:text])
    end
  end
end
