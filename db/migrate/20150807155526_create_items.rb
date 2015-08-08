class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :wishlist
      t.string :name
      t.integer :creation_price
      t.integer :current_price
      t.string :priority
      t.integer :qty_requested
      t.integer :qty_received
      t.string :rating
      t.integer :number_ratings
      t.string :comments
      t.datetime :date_added
      t.string :picture_url
      t.string :link

      t.timestamps null: false
    end
  end
end
