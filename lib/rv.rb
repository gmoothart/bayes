require 'distribution'
require 'rv_assignment'

module Bayes
  class RV
    
    def init(args)
      if args.nil?
        @distribution = BooleanDistribution.new
      end
    end

    def [](val)
      # TODO: wasteful? incorrect? Should a subsequent assignment change
      #   the probability of this instance?
      RVAssignment.new self, @distribution.prob(val) 
    end

    def []=(val, p)
      @distribution.set_prob(val, p) 
    end

    # shortcut for self[false]
    def ~@(val)
      return self[false]
    end

    #shortcut for self[false]
    def -@(val)
      return self[false]
    end

    #shortcut for self[true]
    def +@(val)
      return self[true]
    end
  end
end
