require_relative 'bike'
require_relative 'bike_container'
class DockingStation
  include BikeContainer
  DEFAULT_CAPACITY = 20

  attr_accessor :capacity

  def dock(bike)
    add_bike bike
  end

  def release_bike
    fail 'No bikes available' if working_bikes.empty?
    bikes.delete working_bikes.pop
  end

  private

  attr_reader :bikes

  def working_bikes
    bikes.reject { |bike| bike.broken? }
  end
end
