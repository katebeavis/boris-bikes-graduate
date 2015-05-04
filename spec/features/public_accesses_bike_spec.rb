feature 'member of public accesses bike' do
  let(:docking_station) { DockingStation.new }
  let(:bike) { Bike.new }
  scenario 'docking station releases a working bike' do
    docking_station.dock(bike)
    bike = docking_station.release_bike
    expect(bike).not_to be_broken
  end

  scenario 'docking station doesn\'t release bikes if none are available' do
    expect { docking_station.release_bike }.to raise_error 'No bikes available'
  end

  scenario 'docking station does not release broken bikes' do
    docking_station.dock(bike)
    bike.report_broken
    expect { docking_station.release_bike }.to raise_error 'No bikes available'
  end
end
