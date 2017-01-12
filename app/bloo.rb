module Bloo
  class << self
    def config
      @_config ||= {
        active_record: active_record_config,
        atmos: atmos_config,
      }.merge(bloo_config)
    end

    private

    def active_record_config
      yaml = load_yaml("config/database.yml")
      yaml[:db_password] ||= ENV["DB_PASSWORD"]
      yaml
    end

    def atmos_config
      {
        token: ENV["ATMOS_TOKEN"],
      }
    end

    def bloo_config
      load_yaml("config/bloo.yml").
        deep_merge(slack: { token: ENV["SLACK_REQ_TOKEN"] })
    end

    def load_yaml(file)
      YAML.load_file(file).deep_symbolize_keys
    end
  end
end
