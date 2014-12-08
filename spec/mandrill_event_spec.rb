describe MandrillEvent do

  let(:events) { [] }
  let(:subscriber) { ->(evt){ events << evt } }
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

  describe 'subscribing to a specific event type' do

    before do
      allow(reject_event).to receive(:[]).with('event').and_return('reject')
    end

    context 'with a subscriber that responds to #call' do
      it 'calls the subscriber with the event' do
        MandrillEvent.subscribe('reject', subscriber)

        MandrillEvent.instrument(reject_event)

        expect(events).to eq [reject_event]
      end
    end


  end

end
