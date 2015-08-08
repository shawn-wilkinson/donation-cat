class AddDowncaseNameToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :downcase_name, :string, index: true
  end
end
