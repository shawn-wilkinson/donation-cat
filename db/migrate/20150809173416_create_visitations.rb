class CreateVisitations < ActiveRecord::Migration
  def change
    create_table :visitations do |t|
      t.references :user
      t.references :charity

      t.timestamps null: false
    end
  end
end
