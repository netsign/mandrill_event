require 'active_support/notifications'
require 'mandrill_event/version'
require 'mandrill_event/engine' if defined?(Rails)

module MandrillEvent

  class << self
    attr_accessor :adapter, :backend, :namespace

    def configure(&block)
      raise ArgumentError, 'must provide a block' unless block_given?
      block.arity.zero? ? instance_eval(&block) : yield(self)
    end

    def instrument(params)
      backend.instrument namespace.call(params['event']), params
    end

    def subscribe(name, callable = Proc.new)
      backend.subscribe namespace.to_regexp(name), adapter.call(callable)
    end

  end

  class Namespace < Struct.new(:value, :delimiter)
    def call(name = nil)
      "#{value}#{delimiter}#{name}"
    end

    def to_regexp(name = nil)
      %r{^#{Regexp.escape call(name)}}
    end
  end

  class NotificationAdapter < Struct.new(:subscriber)
    def self.call(callable)
      new(callable)
    end

    def call(*args)
      payload = args.last
      subscriber.call(payload)
    end
  end

  class Error < StandardError; end
  class UnauthorizedError < Error; end

  self.adapter = NotificationAdapter
  self.backend = ActiveSupport::Notifications
  self.namespace = Namespace.new('mandrill_event', '.')

end
