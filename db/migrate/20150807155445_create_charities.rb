class CreateCharities < ActiveRecord::Migration
  def change
    create_table :charities do |t|
      t.string :name
      t.text :description
      t.string :zip_code
      t.string :contact_name
      t.string :contact_email
      t.string :contact_phone
      t.string :password_hash

      t.timestamps null: false
    end
  end
end
