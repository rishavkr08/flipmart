# Frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    authorize Product
  end

  def new
    @product = authorize Product.new
  end

  def create
    @product = authorize Product.create(product_params)
    if @product.save
      flash[:notice] = 'Product was successfully added.'
      redirect_to @product
    else
      render 'new'
    end
  end

  def show
    @product = authorize Product.where('id=?', params[:id]).take
  end

  def edit
    @product = authorize Product.where('id=?', params[:id]).take
  end

  def update
    @product = Product.where('id=?', params[:id]).take
    authorize @product
    if @product.update(product_params)
      flash[:notice] = 'Product was successfully edited.'
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.where('id=?', params[:id]).take
    authorize @product
    @product.destroy
    flash[:alert] = 'Product was successfully removed.'
    redirect_back fallback_location: root_path
  end

  def view_product
    @products = Product.all
    authorize @products
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :image)
  end
end
