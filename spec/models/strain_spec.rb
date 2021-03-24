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

  it 'is not valid without a name' do
    strain = Strain.create(name: "Carmenere")
    expect(strain).to be_valid
  end

  it "can't have a repeated name"
end
