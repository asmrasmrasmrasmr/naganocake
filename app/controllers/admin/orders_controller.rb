class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    # @order_item = OrderItem.find(params[:id])
    # byebug
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to request.referer

  end
  private
  def order_params
    params.require(:order).permit(:status)
  end
  def order_item_params
  params.require(:order_item).permit(:status)
  end
end
