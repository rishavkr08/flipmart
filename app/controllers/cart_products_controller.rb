# frozen_string_literal: true

class CartProductsController < ApplicationController
  before_action :my_cart_list, only: %i[index show create]
  def index
    # @products = Product.includes(:cart_products)
    @products = Product.joins('LEFT OUTER JOIN cart_products on products.id=cart_products.product_id AND cart_products.cart_id = ?',current_user.cart.id.to_s).select('cart_products.qty as qty,products.*').to_a
    @cart_product = authorize CartProduct.new
  end

  def show
    @cart_product = authorize CartProduct.new
    if @product = Product.where(id: params[:id]).take
      # @product = Product.where(id: params[:id]).take
    else
      redirect_to home_index_path
    end
  end

  def create
    @cart_product = authorize CartProduct.new(qty: 1, cart_id: current_user.cart.id, product_id: params[:cart_product][:pid])
    if @cart_product.save
      flash[:notice] = 'Product added to your cart.'
    else
      flash[:alert] = 'Something went wrong.'
    end
    redirect_back fallback_location: root_path
  end

  def destroy
    @cart_product = current_user.cart_products.find_by(product_id: params[:id])
    @cart_product.destroy
    flash[:alert] = 'Product removed from your cart.'
    redirect_back fallback_location: root_path
  end
end
