require_relative '../lib/oystercard'

describe Oystercard do
  it { is_expected.to respond_to(:top_up).with(1).argument }

  # excluding the "deduct" tests because deduct is now a private method.
  # it { is_expected.to respond_to(:deduct) }

  it { is_expected.to respond_to(:in_journey?) }

  it { is_expected.to respond_to(:touch_in).with(1).argument }

  it { is_expected.to respond_to(:touch_out).with(1).argument }

  # describe "#entry_station" do
  let(:station){ double :station}

  xit 'stores the entry station' do
    subject.top_up(50)
    subject.touch_in(station)
    expect(subject.entry_station).to eq station
    end
  # end


  it "has a balance of 0 upon initialization" do
    expect(subject.balance).to eq 0
  end

  it "is initially not in a journey" do
    expect(subject).not_to be_in_journey
  end

  it "has an empty list of journeys when initialised" do
    expect(subject.list_of_journeys).to be_empty
  end

  it "should store a single journey" do
    subject.top_up(20)
    subject.touch_in(station)
    subject.touch_out(station)
    journey = {entry_station: station, exit_station: station}
    expect(subject.journey).to eq journey
  end

  it "should store current journey in the list of journeys" do
    subject.top_up(20)
    subject.touch_in(station)
    subject.touch_out(station)
    journey = {entry_station: station, exit_station: station}
    expect(subject.list_of_journeys).to include journey
  end

  describe "#top_up" do

    it "tops up the balance with the argument balance provided" do
      expect{ subject.top_up(5) }.to change{ subject.balance }.by 5
    end

    it "should fail if balance is more than £90" do
      limit = Oystercard::LIMIT
      subject.top_up(limit)
      expect { subject.top_up(1)}.to raise_error "£#{limit} limit exceeded"
    end
  end

  # skipping the "deduct" tests because deduct is now a private method.
  describe "#deduct" do

    xit "deducts the balance by value amount" do
      subject.top_up(25)
      expect{ subject.deduct(10) }.to change{ subject.balance }.by -10
    end
  end

  describe "#touch_in" do

    it "shouldn't let you touch in if balance is less than £1" do
    #  minimum_balance = Oystercard::MINIMUM
      expect{ subject.touch_in(station) }.to raise_error "Not enough balance"
    end

    it "returns station if the card has been touched in" do
      subject.top_up(20)
      expect(subject.touch_in(station)).to eq station
    end
  end

  describe "#touch_out" do

    it "Set entry_station to nil if the card has been touched out" do
      subject.top_up(25)
      subject.touch_in(station)
      subject.touch_out(station)
      expect(subject.entry_station).to eq nil
    end

    it "deducts minimum fare upon touching out" do
      minimum = Oystercard::MINIMUM
      subject.top_up(25)
      subject.touch_in(station)
      expect { subject.touch_out(station) }.to change { subject.balance }.by -minimum
    end

    xit "stores the exit station on touch out" do
      subject.top_up(10)
      subject.touch_in(station)
      subject.touch_out(station)
      expect(subject.exit_station).to eq station
    end
  end
end
