class RemoveProductIdFromOrderProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_products, :product_id, :integer
  end
end
