class Product < ApplicationRecord
    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/missing.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    has_many :cart_products
    has_many :carts, through: :cart_products
    has_many :order_products
    has_many :orders,through: :order_products
end
