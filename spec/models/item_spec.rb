
require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:test_item) {Item.new(name:'blanket')}

  it 'has a name' do
    expect(test_item.name).to eq("blanket")
  end

  it 'can belong to a wishlist' do
    test_list = Wishlist.new(name:"test list")
    test_item.wishlist = test_list
    expect(test_item.wishlist).to equal(test_list)
  end

  it 'can have a user' do
    test_user = User.new(username:"Sam Wilson")
    test_item.users << test_user
    expect(test_item.users).to include(test_user)
  end



end
