require 'csv'

class Parser
  attr_accessor :file, :csv
  def initialize(file)
    @file = file
  end

  def initial_tags
    csv.flat_map { |row| row[2].gsub(/[\[\]]/, '').split(',').map(&:strip) }
  end

  def tags
    # spaghetti
    arr = csv.flat_map { |row| row[3..33] }.select { |a| !a.nil? }
    arr.flat_map { |a| a.to_s.split(',').map(&:strip).select { |s| !['+', '?', '-', ''].include?(s) } }
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
