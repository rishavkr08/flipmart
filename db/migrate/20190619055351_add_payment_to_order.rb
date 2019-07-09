class AddPaymentToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :payment, :string
    add_column :orders, :total, :integer
    add_column :orders, :qty, :integer
  end
end
