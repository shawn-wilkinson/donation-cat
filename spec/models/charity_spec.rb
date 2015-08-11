require 'rails_helper'

RSpec.describe Charity, type: :model do
  let(:test_charity) {Charity.new(name:"Lake View Mission", description:"test description", contact_name:"Sara Thomas", contact_email:"sara@sara.com")}
  it 'has a name' do

  end

  it 'has a description' do
    expect(test_charity.name).to eq("Lake View Mission")
  end

  it 'has a contact name' do
    expect(test_charity.description).to eq("test description")
  end

  it 'has a contact email' do
    expect(test_charity.contact_name).to eq("Sara Thomas")
  end

  it 'has an email' do
    expect(test_charity.contact_email).to eq("sara@sara.com")
  end

  it 'can can have users' do
    test_user = User.new(username:"tom")
    test_charity.users << test_user
    expect(test_charity.users).to include(test_user)
  end

  it 'can have categories' do
    test_category = Category.new(name:"Economic Empowerment")
    test_charity.categories << test_category
    expect(test_charity.categories).to include(test_category)
  end

  it 'can have wishlists' do
    test_wishlist = Wishlist.new(name:"My Wishlist")
    test_charity.wishlists << test_wishlist
    expect(test_charity.wishlists).to include(test_wishlist)
  end

  it 'can have items' do
    test_wishlist = Wishlist.new(name:"My Wishlist")
    test_item = Item.new(name:"Dog Food")
    test_wishlist.items << test_item
    test_charity.wishlists << test_wishlist
    expect(test_charity.items).to include(test_item)
  end


end
