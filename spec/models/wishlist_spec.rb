
require 'rails_helper'

RSpec.describe Wishlist, type: :model do
  let(:test_list) {Wishlist.new(name:"My Wishlist")}

  it 'has a name' do
    expect(test_list.name).to eq("My Wishlist")
  end

  it 'can have items' do
    test_item = Item.new(name:"Blanket")
    test_list.items << test_item
    expect(test_list.items).to include(test_item)

  end

  it 'belongs to a charity' do
    test_charity = Charity.new(name:"The William House")
    test_list.charity = test_charity
    expect(test_list.charity).to equal(test_charity)
  end

end
