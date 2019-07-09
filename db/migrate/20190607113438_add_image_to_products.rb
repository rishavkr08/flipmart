class AddImageToProducts < ActiveRecord::Migration[5.2]
  def up
    add_attachment :products, :image
  end

  def down
    remove_attachment :products, :image
  end
end
