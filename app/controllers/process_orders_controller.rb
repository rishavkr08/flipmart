# frozen_string_literal: true

class ProcessOrdersController < ApplicationController
  def index
    @orders         = Order.where(aasm_state: params[:order_status]).all
    @order_status   = params[:order_status].humanize
    @order_process  = params[:order_process]
  end

  def update
    Order.find(params[:id]).send(params[:order_update].to_s + '!')
    # method.().call
    # .try("")
    redirect_back fallback_location: root_path
  end
end
