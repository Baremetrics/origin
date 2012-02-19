# encoding: utf-8
require_all __FILE__, "optional"

module Origin
  module Optional
    include BatchSize
    include Hint
    include Limit
    include MaxScan
    include NoTimeout
    include Only
    include ReturnKey
    include ShowDiskLoc
    include Skip
    include Slice
    include Sorting
    include Snapshot
    include Without

    def option(*args)
      clone.tap do |query|
        unless args.compact.empty?
          yield(query.options)
        end
      end
    end
  end
end
