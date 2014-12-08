require "mandrill_event/version"

module MandrillEvent

  class << self

    def configure(&block)
      raise ArgumentError, 'must provide a block' unless block_given?
      block.arity.zero? ? instance_eval(&block) : yield(self)
    end

  end

end
