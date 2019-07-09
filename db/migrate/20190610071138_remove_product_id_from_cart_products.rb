class RemoveProductIdFromCartProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :cart_products, :product_id, :integer
  end
end
