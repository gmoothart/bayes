
module Bayes
  # A simple class mapping a random variable to one of its valid values
  class RVAssignment
    attr_accessor :rv, :val

    def init(rv, val)
      @rv = rv
      @val = val
    end
  end
end

