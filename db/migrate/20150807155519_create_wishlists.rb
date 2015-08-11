class CreateWishlists < ActiveRecord::Migration
  def change
    create_table :wishlists do |t|
      t.references :charity
      t.string :name
      t.string :original_link

      t.timestamps null: false
    end
  end
end
