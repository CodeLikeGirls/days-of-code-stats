module Tags
  class View
    attr_accessor :parser
    def initialize(parser)
      @parser = parser
    end

    def display(size = nil)
      counts = Tags::Counter.new(parser.tags).sorted_counts
      Stats::View.new(counts, symbol: '===').display(size)
    end
  end
end
