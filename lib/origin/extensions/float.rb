# encoding: utf-8
module Origin
  module Extensions

    # This module contains behaviour extensions for floats.
    module Float
      module ClassMethods

        # Evolve the object into a float for selection.
        #
        # @example Evolve the object to a float.
        #   Float.evolve("2.34")
        #
        # @param [ Object ] object The object to evolve.
        #
        # @return [ Float ] The evolved float.
        #
        # @since 1.0.0
        def evolve(object)
          __numeric__(object) rescue object
        end
      end
    end
  end
end

::Float.__send__(:extend, Origin::Extensions::Float::ClassMethods)
