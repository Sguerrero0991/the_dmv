require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@factory).to be_an_instance_of(VehicleFactory)
    end
  end

  describe '#initialize' do
    it 'can load washington ev registration data' do
      vehicles = @factory.create_vehicles(@wa_ev_registrations)
      expect(vehicles).to be_an_instance_of(Array)

      expect(vehicles.first).to be_an_instance_of(Vehicle)
      expect(vehicles.first.vin).to eq("1N4BZ0CP3G")
      expect(vehicles.first.year).to eq(2016)
      expect(vehicles.first.make).to eq("NISSAN")
      expect(vehicles.first.model).to eq("Leaf")
      expect(vehicles.first.engine).to eq(:ev)
      
      expect(vehicles[1]).to be_an_instance_of(Vehicle)
      expect(vehicles[1].vin).to eq("5YJ3E1EB7K")
      expect(vehicles[1].year).to eq(2019)
      expect(vehicles[1].make).to eq("TESLA")
      expect(vehicles[1].model).to eq("Model 3")
      expect(vehicles[1].engine).to eq(:ev)
    end
  end
end
