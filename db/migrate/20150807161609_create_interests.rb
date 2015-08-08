class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.references :user
      t.references :category

      t.timestamps null: false
    end
  end
end
