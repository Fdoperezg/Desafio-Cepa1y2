require 'rails_helper'

RSpec.describe Strain, type: :model do
  it 'is not valid without a name' do
    strain = Strain.create(name: nil)
    expect(strain).to_not be_valid
  end

  it 'is not valid without a name' do
    strain = Strain.create(name: "")
    expect(strain).to_not be_valid
  end

  it 'is valid with name' do
    strain = Strain.create(name: "Carmenere")
    expect(strain).to be_instance_of(Strain)
  end

  it "can't have a repeated name" do
    strain1 = Strain.create(name: "Carmenere")
    strain2 = Strain.create(name: "carmenere")
    expect(strain2).to_not be_valid
  end
end
