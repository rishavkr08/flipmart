# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    if !user_signed_in?
      flash[:alert] = 'You are not authorized to access the page. Please login !'
      redirect_to new_user_session_path
    elsif current_user.role == 'user'
      flash[:alert] = 'You are not authorized to access the page. Please login as Admin!'
      redirect_to home_index_path
    else
      flash[:alert] = 'You are not authorized to access the page. Please login as User!'
      redirect_to products_path
    end
  end

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def my_cart_list
    authorize CartProduct
    @my_cart_products = current_user.cart_products.includes(:product)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password, :role)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :current_password, :role)
    end
  end
end
