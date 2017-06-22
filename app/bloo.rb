module Bloo
  class << self
    def config
      @_config ||= {
        active_record: active_record_config,
      }.merge(base_config)
    end

    private

    def active_record_config
      yaml = load_yaml("database")
      yaml[:db_password] ||= ENV["DB_PASSWORD"]

      yaml
    end

    def base_config
      load_yaml("bloo").deep_merge(slack_config)
    end

    def slack_config
      {
        slack: { token: ENV["SLACK_REQ_TOKEN"] }
      }
    end

    def config_file(filename)
      "config/#{filename}.yml"
    end

    def load_yaml(filename)
      YAML.load_file(config_file filename).deep_symbolize_keys
    end
  end
end
