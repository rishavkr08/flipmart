# frozen_string_literal: true
class CartsController < ApplicationController
  # before_action :user_not_authorized
  after_action :verify_authorized, except: :index

  def index
    my_cart_list
  end

  def update
    authorize Cart
    @qty = current_user.cart.cart_products.find_by product_id: params[:id]
    if params[:qty].to_i == 1
      @qty.increment!(:qty, 1)
      redirect_back fallback_location: root_path
    elsif @qty.qty > 1
      @qty.decrement!(:qty, 1)
      redirect_back fallback_location: root_path
    end
  end
end
