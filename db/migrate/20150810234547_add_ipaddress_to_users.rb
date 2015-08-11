class AddIpaddressToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ipaddress, :string
  end
end
