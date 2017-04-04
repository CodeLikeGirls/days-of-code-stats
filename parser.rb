require 'csv'

class Parser
  attr_accessor :file, :csv
  def initialize(file)
    @file = file
  end

  def tags
    csv.flat_map { |row| row[2].gsub(/[\[\]]/, '').split(',').map(&:strip) }
  end

  def users_progress
    csv.each_with_object({}) do |row, hash|
      hash[row[1]] = row[3..33]
    end
  end

  private

  def csv
    @csv ||= CSV.table(file)
    @csv
  end
end
