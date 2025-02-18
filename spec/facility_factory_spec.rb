require 'spec_helper'
require 'pry'

RSpec.describe FacilityFactory do
  before(:each) do
    @facility_factory = FacilityFactory.new
    @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
    @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    @missouri_facilities = DmvDataService.new.mo_dmv_office_locations
  end

  describe '#initialize' do
    it 'can initialize a facility factory' do
      expect(@facility_factory).to be_an_instance_of(FacilityFactory)
    end
  end

  it 'creates a CO location' do
    facilities = @facility_factory.create_facilites(@co_dmv_office_locations, "colorado")
    expect(facilities).to be_an_instance_of(Array)
    expect(facilities.first).to be_an_instance_of(Facility)
    expect(facilities.first.name).to eq("DMV Tremont Branch")
    expect(facilities.first.address).to eq("2855 Tremont Place")
    expect(facilities.first.phone).to eq("(720) 865-4600")
    #expect(facilities.first.services).to eq(["vehicle titles", "registration", "renewals;  VIN inspections"])
  end

  it 'creates a NY location' do
    facilities = @facility_factory.create_facilites(@new_york_facilities, "new_york")
    expect(facilities).to be_an_instance_of(Array)
    expect(facilities.first).to be_an_instance_of(Facility)
    expect(facilities.first.name).to eq("LAKE PLACID")
    expect(facilities.first.address).to eq("2693 MAIN STREET")
    expect(facilities.first.phone).to eq(nil)
  end 

  it 'creates a MO location' do
    facilities = @facility_factory.create_facilites(@missouri_facilities, "missouri")
    expect(facilities).to be_an_instance_of(Array)
    expect(facilities.first).to be_an_instance_of(Facility)
    expect(facilities.first.name).to eq("Clayton")
    expect(facilities.first.address).to eq("147 N Meramec Ave")
    expect(facilities.first.phone).to eq("(314) 499-7223")
  end 
end