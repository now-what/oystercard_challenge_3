require_relative '../lib/journey'

describe Journey do

  let(:entry_station){ double :entry_station}
  let(:exit_station){ double :exit_station}
  let(:journey){Journey.new}

  describe "#start" do
    it 'should store the entry station' do
        journey.start(entry_station)
        expect(journey.entry_station).to eq entry_station
    end
  end 

  describe "#end" do
  it 'should store the exit station' do
      journey.end(exit_station)
      expect(journey.exit_station).to eq exit_station
  end
end 

end