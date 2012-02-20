# encoding: utf-8
module Origin
  module Extensions
    module Symbol

      def to_direction
        to_s.to_direction
      end

      module ClassMethods

        def add_key(name, operator)
          class_eval <<-EOR
            def #{name}
              Selectable::Key.new(self, #{operator.inspect})
            end
          EOR
        end

        def add_multi_key(name, outer, inner)
          class_eval <<-EOR
            def #{name}
              Selectable::Key.new(self, #{outer.inspect}, #{inner.inspect})
            end
          EOR
        end
      end
    end
  end
end

::Symbol.__send__(:include, Origin::Extensions::Symbol)
::Symbol.__send__(:extend, Origin::Extensions::Symbol::ClassMethods)
