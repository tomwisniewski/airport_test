require '../lib/weather.rb'

class Airport 

  include Weather

  attr_accessor :planes, :capacity

  def initialize(capacity)
    @capacity = capacity
    @planes = []
  end

  def full?
    @planes.size >= @capacity
  end

  def empty?
    @planes.empty?
  end

  def take_off(plane)
    raise "The weather is bad - if we take off we may die!" if weather_conditions == "stormy"
    @planes.delete(plane)
    plane.taken_off!
  end

  def land(plane)
    raise "This plane cannot be landed as airport is full" if full?
    raise "This plane cannot be landed as the weather is bad" if weather_conditions == "stormy"
    @planes << plane 
    plane.landed!
  end
end