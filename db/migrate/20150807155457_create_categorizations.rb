class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.references :charity
      t.references :category

      t.timestamps null: false
    end
  end
end
