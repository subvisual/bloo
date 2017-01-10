module Emilie
  class << self
    def config
      @_config ||= { active_record: active_record_config, slack: slack_config }
    end

    private

    def active_record_config
      yaml = load_yaml("config/database.yml")
      yaml[:db_password] ||= ENV["DB_PASSWORD"]
      yaml
    end

    def slack_config
      yaml = load_yaml("config/slack.yml")
      yaml[:request_token] ||= ENV["SLACK_REQ_TOKEN"]
      yaml
    end

    def load_yaml(file)
      YAML.load_file(file).deep_symbolize_keys
    end
  end
end
