module Emilie
  class << self
    def active_record_config
      @_config ||= load_yaml
    end

    private

    def load_yaml
      yaml = YAML.load_file("config/database.yml")
      yaml[:db_password] ||= ENV["DB_PASSWORD"]
      yaml
    end
  end
end
