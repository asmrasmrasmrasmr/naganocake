class Public::OrdersController < ApplicationController

 def new
   @order = Order.new
 end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to confirm_orders_path
  end

  def confirm
    #if

    #elsif

    @order = Order.new(order_params)
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
  end

  private

  def address_params
    params.require(:order).permit(:postal_code, :address, :name)
  end

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end

end
