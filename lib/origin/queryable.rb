# encoding: utf-8
require "origin/extensions"
require "origin/optional"
require "origin/options"
require "origin/selectable"
require "origin/selector"

module Origin

  # A queryable is any object that needs origin's dsl injected into it to build
  # MongoDB queries. For example, a Mongoid::Criteria is an Origin::Queryable.
  #
  # @example Include queryable functionality.
  #   class Criteria
  #     include Origin::Queryable
  #   end
  module Queryable
    include Selectable
    include Optional

    # Is this queryable equal to another object? Is true if the selector and
    # options are equal.
    #
    # @example Are the objects equal?
    #   queryable == criteria
    #
    # @param [ Object ] other The object to compare against.
    #
    # @return [ true, false ] If the objects are equal.
    #
    # @since 1.0.0
    def ==(other)
      return false unless other.is_a?(Queryable)
      selector == other.selector && options == other.options
    end

    # Initialize the new queryable. Will yield itself to the block if a block
    # is provided for objects that need additional behaviour.
    #
    # @example Initialize the queryable.
    #   Origin::Queryable.new
    #
    # @param [ Hash ] serializers The optional field serializers.
    #
    # @since 1.0.0
    def initialize(serializers = nil)
      @options, @selector = Options.new, Selector.new(serializers)
      yield(self) if block_given?
    end

    # Handle the creation of a copy via #clone or #dup.
    #
    # @example Handle copy initialization.
    #   queryable.initialize_copy(criteria)
    #
    # @param [ Queryable ] other The original copy.
    #
    # @since 1.0.0
    def initialize_copy(other)
      @options = other.options.__deep_copy__
      @selector = other.selector.__deep_copy__
    end
  end
end
