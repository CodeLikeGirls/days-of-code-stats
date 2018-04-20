module DaysOfCode
  class Parser
    class TagParser
      attr_accessor :tags_list
      def initialize(tags_list)
        @tags_list = tags_list.to_str
      end

      def to_a
        return [] if tags_list.empty?
        tags_list.gsub(/[\[\]]/, '').split(',').map(&:strip)
                 .uniq.select { |t| !t.nil? && !signs.include?(t) }
      end

      private

      def signs
        ['+', '?', '-', '']
      end
    end
  end
end
