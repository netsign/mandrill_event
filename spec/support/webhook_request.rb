require 'pathname'
require 'json'

module WebhookRequest

  def fixtures_path
    Pathname.new(File.dirname(__FILE__)).join('..','fixtures')
  end

  def webhook_example_events(event_type)
    sample_path = fixtures_path.join("#{event_type}.json")
    sample_path.read
  end

end
