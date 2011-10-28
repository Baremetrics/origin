# encoding: utf-8
class Hash

  def _add(object)
    apply_strategy(:_add, object)
  end

  def _intersect(object)
    apply_strategy(:_intersect, object)
  end

  def _union(object)
    apply_strategy(:_union, object)
  end

  private

  def apply_strategy(strategy, object)
    tap do |hash|
      object.each_pair do |key, value|
        hash.store(key, hash[key].send(strategy, value))
      end
    end
  end
end
