class AddStateToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :state, :string
  end
end
