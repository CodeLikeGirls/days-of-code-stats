require 'csv'
require './parser'
require './tags/counter'
require './tags/view'
require './progress/counter'
require './progress/view'
require './stats/view'

parser = Parser.new('input.csv.sample')
puts '----------------------------------'
puts '15 most popular tags:'
puts '----------------------------------'

Tags::View.new(parser).display(15)

puts '----------------------------------'
puts 'Users progress:'
puts '----------------------------------'

Progress::View.new(parser).display
