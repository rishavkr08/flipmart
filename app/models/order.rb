# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products

  include AASM

  aasm do
    state :order_processing, initial: true
    state :order_accepted
    state :out_for_delivery
    state :order_delivered

    event :accept do
      transitions from: :order_processing, to: :order_accepted
    end

    event :deliver do
      transitions from: :order_accepted, to: :out_for_delivery
    end

    event :delivered do
      transitions from: :out_for_delivery, to: :order_delivered
    end
  end
end
