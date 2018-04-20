gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require 'byebug'
require_relative '../parser/parser'


class FakeConfig
  def dates
    Date.parse('2018-01-01')..Date.parse('2018-01-16')
  end

  def name_column
    0
  end

  def initial_tags_column
    nil
  end

  def days_columns
    1..15
  end
end

class ConfigWithInitial < FakeConfig
  def initial_tags_column
    1
  end
  def days_columns
    2..10
  end
end


class DaysOfCode::ParserTest < Minitest::Test
  def test_parser_without_initial
    parser = DaysOfCode::Parser.new('test_input_without_initial.csv', FakeConfig.new)
    assert_equal parser.initial_tags, []
  end

  def test_parser_with_initial_tags
    parser = DaysOfCode::Parser.new('test/test_input.csv', ConfigWithInitial.new)
    assert_equal parser.initial_tags, ["react", "js", "python", "математическая логика", "electron", "java", "математика", "big data", "python", "математика", "статистика", "react native", "приложение", "redux", "android", "vk api", "python", "flask", "алгоритмы", "анализ данных в r", "тренажер по интервалам", "Java", "матан", "c", "python", "тестирование", "html", "js", "frameworks", "sql", "алгоритмы", "react", "redux", "js", "rxjs", "c#", "c++", "Linux"]
  end


  def test_parser_popular_tags
    parser = DaysOfCode::Parser.new('test/test_input.csv', ConfigWithInitial.new)
    assert_equal parser.tags.count('python'), 12
    assert_equal parser.tags.count('ruby'), 3
    assert_equal parser.tags.count('алгоритмы'), 7
  end
end

