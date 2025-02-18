class FacilityFactory
  def initialize
  end

  def create_facilites(locations, source)
    locations.map do |location|
      if source == "colorado" 
        facility = Facility.new({
        name: location[:dmv_office],
        address: location[:address_li],
        phone: location[:phone]
      })
        #services: location[:services_p].split(",").map(&:strip)})
      end
    end

    
  end
end