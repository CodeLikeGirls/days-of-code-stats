require 'date'
require './config/config'

week_days = %w[пн вт ср чт пт сб вс]
config = DaysOfCode::Config.new

config.dates.each_with_index do |date, i|
   text = "#{config.emoji} День #{i+1} (#{date.strftime('%e.%m')}, #{week_days[date.wday-1]})\n\n#{config.vk_tag}"
   puts text
   puts "-------------------"
end


