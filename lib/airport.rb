require_relative 'weather'

class Airport
	DEFAULT_CAPACITY = 100
	 attr_reader :planes
	 
	 def initialize(capacity: DEFAULT_CAPACITY, weather: Weather)
		  @capacity = capacity
		  @planes = []
		  @weather = weather
	 end
	 
	 def land plane
		  fail 'Airport is full!' if full?
		  fail "It's too stormy to land!" if stormy?
		  plane.land(self)
		  planes << plane
	 end

	 def depart plane
		  fail "That plane isn't here!" unless planes.include?(plane)
		  fail "It's too stormy to takeoff!" if stormy?
		  plane.depart
		  planes.delete(plane)
	 end

	private
	attr_reader :capacity, :weather

	 def full?
 		 planes.count >= capacity
	 end
	 
	 def stormy?
		weather.stormy?
	 end

end
