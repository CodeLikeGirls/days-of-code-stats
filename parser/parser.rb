require 'csv'
require './parser/tags_parser'

class Parser
  attr_accessor :file, :csv
  def initialize(file)
    @file = file
  end

  def initial_tags
    initial_tags_columns.flat_map { |tags| TagParser.new(tags).to_a }
  end

  def tags
    tags_columns.flatten.flat_map { |tags| TagParser.new(tags).to_a }
  end

  def users_progress
    progress = {}
    names.each_with_index do |name, i|
      progress[name] = tags_columns[i]
    end
    progress
  end

  private

  def names
    csv.flat_map { |row| row[1] }
  end

  def initial_tags_columns
    csv.flat_map { |row| row[2] }
  end

  def tags_columns
    csv.map { |row| row[3..33] }
  end

  def csv
    @csv ||= CSV.table(file)
    @csv
  end
end
