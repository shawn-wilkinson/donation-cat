class CreateCharities < ActiveRecord::Migration
  def change
    create_table :charities do |t|
      t.string :name
      t.string :description
      t.string :contact_name
      t.string :contact_email
      t.string :password_hash

      t.timestamps null: false
    end
  end
end
