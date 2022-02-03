class Station
  attr_reader :name, :zone
  def initialize(name = "default", zone = nil)
     @name = name
     @zone = zone
  end
end
