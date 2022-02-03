require_relative '../lib/station'

describe Station do
  before(:all) do
    @station = Station.new(name = "Waterloo")
  end
  describe "#initialize" do
    it "returns a station name" do
      expect(@station.name).to eq "Waterloo"
    end
  end
end
