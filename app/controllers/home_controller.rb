# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @products = Product.all.limit(4)
    my_cart_list
  end
end
