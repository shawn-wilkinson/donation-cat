class AddLatitudeToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :latitude, :float
  end
end
