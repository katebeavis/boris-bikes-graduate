feature 'member of public returns bike' do
  let(:docking_station) { DockingStation.new }
  let(:bike) { Bike.new }
  scenario 'bike cannot be docked when station is full' do
    docking_station
    docking_station.capacity.times { docking_station.dock(bike) }
    expect { docking_station.dock(bike) }.to raise_error "DockingStation full"
  end

  scenario 'bike can be reported broken when returned' do
    docking_station = DockingStation.new
    bike = Bike.new
    bike.report_broken
    expect(bike).to be_broken
    expect { docking_station.dock bike }.not_to raise_error
  end
end
