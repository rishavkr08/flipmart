class AddOrderToOrderProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :order_products, :order, foreign_key: true
  end
end
