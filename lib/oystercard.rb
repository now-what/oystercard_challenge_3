class Oystercard

    attr_reader :balance, :entry_station, :exit_station, :list_of_journeys, :journey
    LIMIT = 90
    MINIMUM = 1

    def initialize
      @balance = 0
      @in_journey = false
      @list_of_journeys = []
      @entry_station = nil
      @exit_station = nil
      @journey = {}
    end

    def top_up(value)
      fail "£#{LIMIT} limit exceeded" if balance + value > LIMIT
      @balance += value
    end

    def in_journey?
      # @in_journey
      if @entry_station == nil
        false
      else
        true
      end
    end

    def touch_in(station)
      fail "Not enough balance" if balance < MINIMUM
      @entry_station = station
      # @in_journey = true
    end

    def touch_out(station)
      deduct(MINIMUM)
      # @in_journey = false
      @entry_station = nil
      @exit_station = station
    end

  private

    def deduct(value)
      @balance -= value
    end

  end
