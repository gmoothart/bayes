
module Bayes
  class Distribution

    def prob(domain_val)
      return @d[ domain_val ]
    end

    def set_prob(domain_val, p)
      @d[ domain_val ] = p
    end
  end

  class BooleanDistribution < Distribution

    def init
      @d = { true => nil, false => nil }
    end
  end
end
