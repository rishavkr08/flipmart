class Cart < ApplicationRecord
    #has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/missing.png"
    has_many :cart_products, dependent: :destroy
    has_many :products, through: :cart_products
    belongs_to :user
end
