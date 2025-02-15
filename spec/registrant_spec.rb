require 'spec_helper'

RSpec.describe '#initialize' do
  it 'is a Registrant' do 
    registrant_1 = Registrant.new('Bruce', 18, true)
    registrant_2 = Registrant.new('Penny', 15 )
    expect(registrant_1).to be_a(Registrant)
  end

  it 'has an name' do
    registrant_1 = Registrant.new('Bruce', 18, true)
    registrant_2 = Registrant.new('Penny', 15 )
    expect(registrant_1.name).to eq('Bruce')
    expect(registrant_2.name).to eq('Penny')
  end

  it 'has an age' do
    registrant_1 = Registrant.new('Bruce', 18, true)
    registrant_2 = Registrant.new('Penny', 15 ) 
    expect(registrant_1.age).to eq(18)
    expect(registrant_2.age).to eq(15)
  end

  it 'check if it has a permit' do
    registrant_1 = Registrant.new('Bruce', 18, true)
    registrant_2 = Registrant.new('Penny', 15 ) 
    expect(registrant_1.permit?).to eq(true)
    expect(registrant_2.permit?).to eq(false)
  end

  it 'provides license data' do
    registrant_1 = Registrant.new('Bruce', 18, true)
    registrant_2 = Registrant.new('Penny', 15 ) 
    expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    expect(registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
  end

  it 'earns a permit' do
    registrant_1 = Registrant.new('Bruce', 18, true)
    registrant_2 = Registrant.new('Penny', 15 ) 
    expect(registrant_1.earn_permit).to eq(true)
    expect(registrant_2.earn_permit).to eq(true) 
  end

end
