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
      elsif source == "new_york"
        facility = Facility.new({
          name: location[:office_name],
          address: location[:street_address_line_1],
          phone: location[:public_phone_number],
        })
      elsif source == "missouri"
        facility = Facility.new({
          name: location[:name],
          address: location[:address1],
          phone: location[:phone],
        })
      end
    end



    
  end
end