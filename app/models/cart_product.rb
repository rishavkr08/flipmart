class CartProduct < ApplicationRecord
    #has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/missing.png"
    belongs_to :cart
    belongs_to :product
end
