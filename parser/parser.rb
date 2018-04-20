require 'csv'
require './parser/tags_parser'
require './config/config'

module DaysOfCode
  class Parser
    def initialize(file, config = DaysOfCode::Config.new)
      @file = file
      @config = config
    end

    def initial_tags
      initial_tags_column.flat_map { |tags| TagParser.new(tags).to_a }
    end

    def tags
      tags_columns.flatten.compact.flat_map { |tags| TagParser.new(tags).to_a }
    end

    def users_progress
      progress = {}
      names.each_with_index do |name, i|
        progress[name] = tags_columns[i]
      end
      progress
    end

    private

    attr_reader :file, :config

    def names
      csv.flat_map { |row| row[config.name_column] }.compact
    end

    def initial_tags_column
      return [] unless config.initial_tags_column
      csv.flat_map { |row| row[config.initial_tags_column] }.compact
    end

    def tags_columns
      csv.map { |row| row[config.days_columns] }
    end

    def csv
      @csv ||= CSV.table(file)
      @csv
    end
  end
end
