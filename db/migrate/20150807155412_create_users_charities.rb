class CreateUsersCharities < ActiveRecord::Migration
  def change
    create_table :users_charities do |t|
      t.references :user
      t.references :charity

      t.timestamps null: false
    end
  end
end
