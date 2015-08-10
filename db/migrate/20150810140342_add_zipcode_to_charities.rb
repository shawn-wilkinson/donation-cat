class AddZipcodeToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :zip_code, :string
  end
end
