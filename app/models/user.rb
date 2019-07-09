class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :cart
  has_many :orders
  has_many :cart_products, through: :cart
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
end
