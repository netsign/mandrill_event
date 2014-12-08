describe MandrillEvent do

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
end
