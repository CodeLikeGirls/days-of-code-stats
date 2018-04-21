require './parser/parser'
require './tags/counter'
require './progress/counter'
require './progress/view'
require './stats/view'
require './images/image_generator'

DELIMITER = '-------------------------------------------'

def header(title)
  [DELIMITER, title, DELIMITER]
end

def parser
  filename = ENV.fetch('FILE', 'input.csv')
  DaysOfCode::Parser.new(filename)
end

namespace :tags do
  # most popular tags planned to be learned
  task :initial_popular do
    cnt = ENV.fetch('COUNT', 15)
    # parser = Parser.new('input.csv')
    header = header("#{cnt} most popular tags (initial):")
    counts = DaysOfCode::Tags::Counter.new(parser.initial_tags).sorted_counts
    lines = DaysOfCode::Stats::View.new(counts, symbol: '===').display(cnt)

    header + lines.each { |line| puts line }
    DaysOfCode::ImageGenerator.new(header + lines, 'initial_tags.png').draw
  end

  # most popular tags overall
  task :popular do
    cnt = ENV.fetch('COUNT', 15)
    header = header("#{cnt} most popular tags:")
    counts = DaysOfCode::Tags::Counter.new(parser.tags).sorted_counts

    lines = DaysOfCode::Stats::View.new(counts, symbol: '=').display(cnt)
    (header + lines).each { |line| puts line }

    DaysOfCode::ImageGenerator.new(header + lines, 'popular_tags.png').draw
  end

  # individual progress for each user
  # TODO: refactor
  task :for_users do
    # parser = Parser.new('input.csv')
    progress = parser.users_progress
    counts = DaysOfCode::Progress::Counter.new(progress).counts
    progress.each do |name, tags|
      user_tags = tags.map do |t|
        DaysOfCode::Parser::TagParser.new(t.to_s).to_a
      end.flatten
      user_tags_counts = DaysOfCode::Tags::Counter.new(user_tags).counts
      # sum = user_tags_counts.values.inject(&:+)
      lines = DaysOfCode::Stats::View.new(user_tags_counts, symbol: '*').display

      # header = header("#{name} #{'👑' if counts[name] == 30}")

      DaysOfCode::ImageGenerator.new(header + lines, "stats_#{name}.png").draw
    end
  end
end

task :progress do
  # parser = Parser.new('input.csv')
  header = header('Users progress:')
  lines = DaysOfCode::Progress::View.new(parser).display

  (header + lines).each { |line| puts line }
  DaysOfCode::ImageGenerator.new(header + lines, 'progress.png').draw
end













