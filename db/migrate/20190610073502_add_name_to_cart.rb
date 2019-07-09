class AddNameToCart < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :name, :string
  end
end
