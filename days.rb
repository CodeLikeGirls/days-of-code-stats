require 'date'
require './config/config'

logo = '🌱💻'
tag = '#spring2018@days_of_code'
week_days = %w[пн вт ср чт пт сб вс]
length = 21

start = Date.parse('9.04.2018')
1.upto(length) do |i|
  day = (start + i - 1).strftime('%e.%m')
  text = "#{logo} День #{i} (#{day}, #{week_days[(i-1)%7]})\n\n#{tag}"
  puts text
  puts "-------------------"
end


