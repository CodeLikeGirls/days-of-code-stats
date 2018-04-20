module DaysOfCode
  module Progress
    class Counter
      INVALID = ['?', '-'].freeze

      attr_accessor :data
      def initialize(data)
        @data = data
      end

      def counts
        users_stats = {}
        data.each do |name, days|
          users_stats[name] = days.select { |d| valid_day?(d) }.count
        end
        users_stats
      end

      private

      def valid_day?(d)
        d = d.to_s.strip
        !d.empty? && !INVALID.include?(d)
      end
    end
  end
end
