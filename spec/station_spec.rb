require_relative '../lib/station'

describe Station do

  before(:all) do
    @station = Station.new(name = "Waterloo", zone = 1)
  end

  describe "#initialize" do
    it "returns a station name" do
      expect(@station.name).to eq "Waterloo"
    end

    it "returns a station zone" do
      expect(@station.zone).to eq 1
    end
  end

end
