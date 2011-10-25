# encoding: utf-8
require "origin/selection/strategies/append"
require "origin/selection/strategies/expanded"
require "origin/selection/strategies/intersect"
require "origin/selection/strategies/multi"
require "origin/selection/strategies/override"
require "origin/selection/strategies/union"

module Origin
  module Selection
    module Strategies
      include Append
      include Expanded
      include Intersect
      include Multi
      include Override
      include Union

      attr_accessor :strategy

      private

      def assimilate(criterion = nil)
        clone.tap do |query|
          if criterion
            criterion.each_pair do |field, value|
              yield(query, field, value)
            end
          end
        end
      end
    end
  end
end
