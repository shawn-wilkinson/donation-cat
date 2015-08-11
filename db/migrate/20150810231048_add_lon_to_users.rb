class AddLonToUsers < ActiveRecord::Migration
  def change
    add_column :users, :lon, :float
  end
end
