class AddStateToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :aasm_state, :string
  end
end
