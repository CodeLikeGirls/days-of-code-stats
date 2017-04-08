require './parser/parser'
require './tags/counter'
require './progress/counter'
require './progress/view'
require './stats/view'

namespace :tags do
  # initial popular
  task :initial_popular do
    cnt = ENV.fetch('COUNT', 15)
    parser = Parser.new('input.csv')
    puts '----------------------------------'
    puts "#{cnt} most popular tags (initial):"
    puts '----------------------------------'

    counts = Tags::Counter.new(parser.initial_tags).sorted_counts
    Stats::View.new(counts, symbol: '===').display(cnt)

    # Tags::View.new(parser).display(cnt.to_i)
  end

  task :popular do
    cnt = ENV.fetch('COUNT', 15)
    puts '----------------------------------'
    puts "#{cnt} most popular tags:"
    puts '----------------------------------'
    parser = Parser.new('input.csv')
    counts = Tags::Counter.new(parser.tags).sorted_counts
    Stats::View.new(counts, symbol: '==').display(cnt)
  end
end

task :progress do
  parser = Parser.new('input.csv')
  puts '----------------------------------'
  puts 'Users progress:'
  puts '----------------------------------'
  Progress::View.new(parser).display
end
