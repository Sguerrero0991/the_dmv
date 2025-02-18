require 'spec_helper'
require 'pry'

RSpec.describe FacilityFactory do
  before(:each) do
    @facility_factory = FacilityFactory.new
    @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
  end

  describe '#initialize' do
    it 'can initialize a facility factory' do
      expect(@facility_factory).to be_an_instance_of(FacilityFactory)
    end
  end

  describe '#create_facilities' do
    it 'creates a CO location' do
      facilities = @facility_factory.create_facilites(@co_dmv_office_locations, "colorado")
      expect(facilities).to be_an_instance_of(Array)
      expect(facilities.first).to be_an_instance_of(Facility)
      expect(facilities.first.name).to eq("DMV Tremont Branch")
      expect(facilities.first.address).to eq("2855 Tremont Place")
      expect(facilities.first.phone).to eq("(720) 865-4600")
      #expect(facilities.first.services).to eq(["vehicle titles", "registration", "renewals;  VIN inspections"])
    end
  end
end