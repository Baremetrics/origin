# encoding: utf-8
module Origin
  module Selection
    module Strategies
      module Expanded

        def _expanded(criterion, outer, inner)
          selection(criterion) do |selector, field, value|
            selector.store(field, { outer => { inner => value }})
          end
        end
      end
    end
  end
end
