class CreateUsersItems < ActiveRecord::Migration
  def change
    create_table :users_items do |t|
      t.references :user
      t.references :item

      t.timestamps null: false
    end
  end
end
