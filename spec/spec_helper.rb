require 'pry'
require File.expand_path('../../lib/mandrill_event', __FILE__)

# Dir[File.expand_path('../spec/support/**/*.rb', __FILE__)].each { |f| require f }

RSpec.configure do |config|
  config.order = 'random'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  # config.before do
  #   @event_retriever = MandrillEvent.event_retriever
  #   @notifier = MandrillEvent.backend.notifier
  #   MandrillEvent.backend.notifier = @notifier.class.new
  # end

  # config.after do
  #   MandrillEvent.event_retriever = @event_retriever
  #   MandrillEvent.backend.notifier = @notifier
  # end
end
