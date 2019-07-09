class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :price
      t.string :category
      t.string :tag
      t.string :rating

      t.timestamps
    end
  end
end
