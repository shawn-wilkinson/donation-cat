class AddStreetAddressToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :street_address, :string
  end
end


