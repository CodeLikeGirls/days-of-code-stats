module Stats
  class View
    # options: display_symbol, max_size

    attr_accessor :counts, :finish, :symbol
    def initialize(counts, options = {})
      @counts = counts
      @finish = options.fetch(:finish, nil)
      @symbol = options.fetch(:symbol, '+')
    end

    def display(size = nil)
      self.counts = counts.first(size.to_i).to_h unless size.nil?
      counts.each do |key, value|
        progress = symbol * value
        stats_row = "#{formatted_name(key)}: #{progress} "
        stats_row += finish.nil? ? "(#{value})" : "(#{value}/#{finish})"
        puts stats_row
      end
    end

    private

    def formatted_name(name)
      width = counts.keys.map(&:size).max + 1
      [name, ' ' * (width - name.size)].join
    end
  end
end
