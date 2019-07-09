class RemoveNameFromCart < ActiveRecord::Migration[5.2]
  def change
    remove_column :carts, :name, :string
  end
end
