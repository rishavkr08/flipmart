# frozen_string_literal: true

class ProcessOrdersController < ApplicationController
  def index
    user_order_track = {
      order_processing: :accept,
      order_accepted: :deliver,
      out_for_delivery: :delivered,
      order_delivered: :success
    }
    param           = params[:order_status].parameterize.underscore.to_sym
    @orders         = Order.where(aasm_state: params[:order_status]).all
    @order_status   = params[:order_status].sub('_', ' ').capitalize
    @order_process  = user_order_track[param].to_s
  end

  def update
    Order.find(params[:id]).method(params[:order_update] << '!').call
    redirect_back fallback_location: root_path
  end
end
