class AddDowncaseNameToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :downcase_name, :string, index: true
  end
end
