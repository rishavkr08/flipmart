# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :my_cart_list
  def index
    @orders = authorize current_user.orders.order(id: :desc)
  end

  def create
    @order = authorize Order.new(user_id: current_user.id, payment: params[:order][:payment], total: params[:order][:total], qty: params[:order][:qty], status: 'Order Processing')
    if @order.save
      @my_cart = current_user.cart_products
      @my_cart.find_each do |cart|
        order_product = OrderProduct.new(order_id: current_user.orders.last.id, product_id: cart.product_id, qty: cart.qty)
        cart.destroy if order_product.save
        flash[:notice] = 'Order placed successfully.'
      end
      redirect_to carts_path
    else
      redirect_to home_index_path
    end
  end

  def show
    @my_order_products = Order.where(id: params[:id]).take.order_products.includes(:product)
  end
end
