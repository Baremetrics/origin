# encoding: utf-8
module Origin
  module Selectable

    # Provides behaviour for performing $elemMatch queries.
    module ElemMatch

      # Select with an $elemMatch.
      #
      # @example Add criterion for a single match.
      #   queryable.elem_match(field: { name: "value" })
      #
      # @example Add criterion for multiple matches.
      #   queryable.elem_match(
      #     field: { name: "value" },
      #     other: { name: "value"}
      #   )
      #
      # @example Execute an $elemMatch in a where query.
      #   queryable.where(:field.elem_match => { name: "value" })
      #
      # @param [ Hash ] criterion The field/match pairs.
      #
      # @return [ Queryable ] The cloned queryable.
      #
      # @since 1.0.0
      def elem_match(criterion = nil)
        __override__(criterion, "$elemMatch")
      end

      ::Symbol.add_key(:elem_match, "$elemMatch")
    end
  end
end
