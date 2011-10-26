# encoding: utf-8
module Origin
  module Selection
    module Ne

      def ne(criterion = nil)
        override!(criterion, "$ne")
      end

      ::Symbol.class_eval do

        def ne
          Key.new(self, "$ne")
        end
      end
    end
  end
end
