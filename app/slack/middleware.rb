module Emilie::Slack
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      request = Rack::Request.new(env)
      return if own_message?(request)

      @app.call(env)
    end

    private

    def own_message?(request)
      request.params["user_name"] == Emilie.config[:slack][:bot_name]
    end
  end
end
