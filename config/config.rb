require 'yaml'

module DaysOfCode
  class Config
    def initialize
      @config = YAML.load_file('config.yml').fetch('challenge')
    end

    def dates
      Date.parse(config.fetch('start_date'))..Date.parse(config.fetch('end_date'))
    end

    %w[name_column initial_tags_column].each do |name|
      define_method name do
        config.fetch(name)
      end
    end

    def days_columns
      config.fetch('days_columns_from').to_i..config.fetch('days_columns_to').to_i
    end

    private

    attr_reader :config
  end
end
