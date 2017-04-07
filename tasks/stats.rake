require './parser'
require './tags/counter'
require './tags/view'
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
    Tags::View.new(parser).display(cnt.to_i)
  end

  task :popular do
    # TODO
  end
end

task :progress do
  parser = Parser.new('input.csv')
  puts '----------------------------------'
  puts 'Users progress:'
  puts '----------------------------------'
  Progress::View.new(parser).display
end
