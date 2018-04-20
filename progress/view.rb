module DaysOfCode
  module Progress
    class View
      MAX = 30

      attr_accessor :parser
      def initialize(parser)
        @parser = parser
      end

      def display
        counts = Progress::Counter.new(parser.users_progress).counts
        Stats::View.new(counts, symbol: '+', finish: MAX).display
      end
    end
  end
end
