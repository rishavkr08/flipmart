class CreateProcessOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :process_orders do |t|

      t.timestamps
    end
  end
end
