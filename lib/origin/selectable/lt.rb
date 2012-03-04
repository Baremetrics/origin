# encoding: utf-8
module Origin
  module Selectable

    # Provides behaviour for $lt selection.
    module Lt

      #
      # @return [ Queryable ] The cloned queryable.
      #
      # @since 1.0.0
      def lt(criterion = nil)
        __override__(criterion, "$lt")
      end

      # Add the key to symbol for where matching.
      #
      # @example Execute an $lt in a where query.
      #   queryable.where(:field.lt => 10)
      #
      # @since 1.0.0
      ::Symbol.add_key(:lt, "$lt")
    end
  end
end
