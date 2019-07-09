class RemoveCartIdFromCartProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :cart_products, :cart_id, :integer
  end
end
