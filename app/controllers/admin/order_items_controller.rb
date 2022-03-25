class Admin::OrderItemsController < ApplicationController
  before_action :authenticate_admin!
  def update
    @order_item = OrderItem.find(params[:id])
    if @order_item.update(order_item_params)
      if params[:order_item][:status] == "in_production"
        @order_item.order.status = "in_production"
        @order_item.order.save
      elsif @order_item.order.order_items.count == @order_item.order.order_items.where(status: "production_complete").count
        @order_item.order.status = "prepairing_to_ship"
        @order_item.order.save
      end
    end
    redirect_to request.referer
  end

  private
   def order_item_params
    params.require(:order_item).permit(:status)
   end
end
