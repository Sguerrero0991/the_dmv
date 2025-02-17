class VehicleFactory
  def initialize
  end

  def create_vehicles(vehicle_data)
    vehicle_data.map do |data|
      vehicle = Vehicle.new({
        vin: data[:vin_1_10],
        year: data[:model_year].to_i,
        make: data[:make], 
        model:data[:model], 
        engine: :ev})
    end
  end
end

