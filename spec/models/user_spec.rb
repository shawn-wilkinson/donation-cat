
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:test_user) {User.new(username:"Lilly Smith", email:"lilly@lilly.com", password_hash:"password")}

  it 'has a username' do
    expect(test_user.username).to eq("Lilly Smith")
  end

  it 'has an email' do
    expect(test_user.email).to eq("lilly@lilly.com")
  end

  it 'has a password hash' do
    expect(test_user.password_hash).to eq("password")
  end

  it 'can be interested in categories' do
    test_category = Category.new(name:"Education")
    test_user.categories << test_category
    expect(test_user.categories).to include(test_category)

  end

  it 'can have charities' do
    test_charity = Charity.new(name:"The Lake Institute")
    test_user.charities << test_charity
    expect(test_user.charities).to include(test_charity)

  end

  it 'can have items' do
    test_item = Item.new(name:"Book")
    test_user.items << test_item
    expect(test_user.items).to include(test_item)

  end







end
