module Stats
  class View
    # options: display_symbol, max_size

    attr_accessor :data, :finish, :symbol, :display_data
    def initialize(data, options = {})
      @data = data.to_h
      @finish = options.fetch(:finish, nil)
      @symbol = options.fetch(:symbol, '+')
    end

    def display(size = nil)
      self.display_data = size.nil? ? data : data.first(size.to_i).to_h
      self.display_data = self.display_data.select { |d| !d.to_s.empty? }
      display_data.each do |key, count|
        puts row(key, count)
      end
    end

    private

    def row(key, count)
      progress = symbol * count
      stats_row = "#{formatted_name(key)}: #{progress}"
      stats_row += ' ' unless count.to_i.zero?
      stats_row += finish.nil? ? "(#{count})" : "(#{count}/#{finish})"
      stats_row
    end

    def formatted_name(name)
      width = display_data.keys.map(&:size).max + 1
      [name, ' ' * (width - name.size)].join
    end
  end
end
