class AddQtyToOrderProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :order_products, :qty, :integer
  end
end
