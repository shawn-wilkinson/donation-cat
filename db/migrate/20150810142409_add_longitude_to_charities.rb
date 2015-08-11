class AddLongitudeToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :longitude, :float
  end
end
