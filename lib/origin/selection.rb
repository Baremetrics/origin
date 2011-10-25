# encoding: utf-8
require "origin/selection/all"
require "origin/selection/and"
require "origin/selection/between"
require "origin/selection/elem_match"
require "origin/selection/exists"
require "origin/selection/gt"
require "origin/selection/gte"
require "origin/selection/in"
require "origin/selection/key"
require "origin/selection/lt"
require "origin/selection/lte"
require "origin/selection/near"
require "origin/selection/size"
require "origin/selection/strategies"
require "origin/selection/type"

module Origin

  # The selection module is included to get all the behaviour for every MongoDB
  # query operator.
  module Selection
    # Include the strategies for override, intersection, and union of operators
    # that use array values.
    include Strategies

    # Include all the individual operator modules.
    include All
    include And
    include Between
    include ElemMatch
    include Exists
    include Gt
    include Gte
    include In
    include Lt
    include Lte
    # include Mod
    # include Ne
    include Near
    # include Nin
    # include Nor
    # include Or
    include Size
    include Type
    # include Where
  end
end
