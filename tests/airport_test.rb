require 'minitest/autorun'
require '../lib/airport.rb'
require '../lib/plane.rb'
require '../lib/weather.rb'

class TestAirport < MiniTest::Unit::TestCase

  include Weather
 
  def setup
    @airport = Airport.new(2) 
    @plane = Plane.new(1)
  end
 
  def test_plane_can_land 
    @airport.stub :weather_conditions, "sunny" do
      @airport.land(@plane)
      assert_equal 1, @airport.planes.count 
    end   
  end
 
  # A plane currently in the airport can be requested to take off.
  def test_plane_can_take_off
    @airport.stub :weather_conditions, "sunny" do
      plane2 = Plane.new(2)
      @airport.land(@plane)
      @airport.land(plane2)
      @airport.take_off(@plane)
      assert_equal 1, @airport.planes.count
    end  
  end
 
  # No more planes can be added to the airport, if it's full.
  # It is up to you how many planes can land in the airport and how that is impermented.
  def test_no_plane_can_land_if_airport_is_full
    @airport.stub :weather_conditions, "sunny" do
      plane2 = Plane.new(2)
      plane3 = Plane.new(3)
      @airport.land(@plane)
      @airport.land(plane3)
      assert_raises(RuntimeError) do
        @airport.land(plane2)
      end
    end  
   end
 
 
  # If the airport is full then no planes can land
  def test_that_plane_can_land_after_airport_is_full_and_a_take_off_happened
    @airport.stub :weather_conditions, "sunny" do
      plane2 = Plane.new(2)
      plane3 = Plane.new(3)
      @airport.land(@plane)
      @airport.land(plane2)
      assert_raises(RuntimeError) do
        @airport.land(plane3)
      end
      @airport.take_off(@plane)
      assert_equal 1, @airport.planes.count
      @airport.land(plane3)
      assert_equal 2, @airport.planes.count
    end  
  end
 
  # When we create a new plane, it should have a "flying" status, thus planes can not be created in the airport.
  def test_plane_has_a_flying_status_after_it_is_created
    assert_equal "flying", @plane.status
  end 
 
  # When we land a plane at the airport, the plane in question should have its status changed to "landed"
  def test_plane_has_a_landed_status_after_landing 
      @airport.stub :weather_conditions, "sunny" do
        @airport.land(@plane) 
        assert_equal "landed", @plane.status 
      end  
  end
 
 
  # When the plane takes of from the airport, the plane's status should become "flying"
  def test_plane_has_a_flying_status_after_take_off
    @airport.stub :weather_conditions, "sunny" do 
      @airport.land(@plane)
      assert_equal "landed", @plane.status
      @airport.take_off(@plane)
      assert_equal "flying", @plane.status
    end  
  end
 
  # include a weather condition using a module
  # The weather must be random and only have two states "sunny" or "stormy".
  # Try and take off a plane, but if the weather is stormy, the plane can not take off and must remain in the airport.
 
  # This will require stubbing to stop the random return of the weather.
  def test_that_no_plane_can_take_off_with_a_storm_brewing
   
    @airport.stub :weather_conditions, "stormy" do
      assert_raises(RuntimeError) do
        @airport.take_off(@plane)
      end
    end
  end
 
  # As with the above test, if the airport has a weather condition of stormy,
  # the plane can not land, and must not be in the airport
  def test_that_no_plane_can_land_when_there_is_a_storm_brewing
    @airport.stub :weather_conditions, "stormy" do
      assert_raises(RuntimeError) do
        @airport.land(@plane)
      end  
    end  
  end
 
  # grand final
  # Given 6 planes, each plane must land. When the airport is full, every plane must take off again.
  # Be careful of the weather, it could be stormy!
  # Check when all the planes have landed that they have the right status "landed"
  # Once all the planes are in the air again, check that they have the status of flying!
  def test_all_planes_can_land_then_all_planes_in_airport_can_takeoff  
    airport2 = Airport.new(6)
    airport2.stub :weather_conditions, "sunny" do
      6.times do |i|
        plane = Plane.new(i)
        airport2.land(plane)
      end
    end
      
    assert airport2.full?  

    airport2.planes.each do |plane|
      assert_equal 'landed', plane.status
    end 

    airport2.stub :weather_conditions, "sunny" do
      airport2.planes.each do |plane|
        airport2.take_off(plane)
        assert_equal 'flying', plane.status
      end  
    end

    puts airport2.planes.count
  end
 
end