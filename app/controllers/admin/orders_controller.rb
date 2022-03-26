class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    # @order_item = OrderItem.find(params[:id])
    # byebug
  end

  def update
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    if @order.update(order_params)
    if params[:order][:status] == "payment_confirmation"
      @order_items.each do |order_item|
      order_item.status = "production_pending"
      order_item.save
    end
    end
    redirect_to request.referer
    end
  end
  private
  def order_params
    params.require(:order).permit(:status)
  end
  def order_item_params
  params.require(:order_item).permit(:status)
  end
end
