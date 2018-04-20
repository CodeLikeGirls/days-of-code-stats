module DaysOfCode
  module Tags
    class Counter
      attr_accessor :tags
      def initialize(tags)
        @tags = tags
      end

      def sorted_counts
        counts.sort_by { |_key, value| -value }
      end

      # private

      def counts
        tags.each_with_object({}) do |tag, hash|
          hash[tag] ||= 0
          hash[tag] += 1
        end
      end
    end
  end
end
