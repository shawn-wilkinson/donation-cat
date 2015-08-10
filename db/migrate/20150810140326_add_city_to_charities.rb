class AddCityToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :city, :string
  end
end
