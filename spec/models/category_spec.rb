
require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:test_category) {Category.new(name:"Environment")}

  it "has a name" do
    expect(test_category.name).to eq("Environment")
  end

  it 'can have charities' do
    test_charity = Charity.new(name:"Open Door Mission")
    test_category.charities << test_charity
    expect(test_category.charities).to include(test_charity)
  end

  it 'can have users' do
    test_user = User.new(username:"Thomas Thomson")
    test_category.users << test_user
    expect(test_category.users).to include(test_user)
  end

end
