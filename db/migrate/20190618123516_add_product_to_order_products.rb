class AddProductToOrderProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :order_products, :product, foreign_key: true
  end
end
