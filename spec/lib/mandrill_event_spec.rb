require 'spec_helper'

RSpec.describe MandrillEvent do
  let(:events) { [] }
  let(:subscriber) { ->(evt) { events << evt } }
  let(:reject_event) { double('reject') }

  describe '.configure' do
    it 'yields itself to the block' do
      yielded = nil
      MandrillEvent.configure { |events| yielded = events }
      expect(yielded).to eq MandrillEvent
    end

    it 'requires a block argument' do
      expect { MandrillEvent.configure }.to raise_error ArgumentError
    end
  end

  describe '.process' do
    let(:json) { webhook_example_events('rejects') }
    let(:params) { {'mandrill_events' =>  json} }

    it 'calls instrument for each event' do
      MandrillEvent.subscribe('reject', subscriber)
      MandrillEvent.process(params)
      expect(events).to eq JSON.parse(json)
    end
  end

  describe 'subscribing to a specific event type' do
    before do
      allow(reject_event).to receive(:[]).with('event').and_return('reject')
    end

    context 'with a subscriber that responds to #call' do
      it 'calls the subscriber with the event' do
        MandrillEvent.subscribe('reject', subscriber)
        expect(subscriber).to receive(:call).with(reject_event)
        MandrillEvent.instrument(reject_event)
      end
    end
  end
end
