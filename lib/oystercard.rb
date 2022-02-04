class Oystercard

    attr_reader :balance, :list_of_journeys, :journey
    LIMIT = 90
    MINIMUM = 1

    def initialize
      @balance = 0
      @list_of_journeys = []
      @journey = {:entry_station => nil , :exit_station => nil}
    end

    def top_up(value)
      fail "£#{LIMIT} limit exceeded" if balance + value > LIMIT
      @balance += value
    end

    def in_journey?

      if journey[:entry_station] == nil
        false
      else
        true
      end
    end

    def touch_in(station)
      fail "Not enough balance" if balance < MINIMUM
      @journey[:entry_station] = station
    end

    def touch_out(station)
      deduct(MINIMUM)
      @journey[:exit_station] = station
      @list_of_journeys << @journey
    end

  private

    def deduct(value)
      @balance -= value
    end

  end
