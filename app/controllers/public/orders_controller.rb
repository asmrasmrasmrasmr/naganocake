class Public::OrdersController < ApplicationController

 def new
   @order = Order.new
 end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to complete_orders_path
  end

  def confirm
    @cart_items = CartItem.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    @shipping_fee = FEE
    @order = Order.new(order_params)
    if params[:order][:full_address] == "1"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:full_address] == "2"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else params[:order][:full_address] == "3"
      @address = Address.new(address_params)
      @address.customer_id = current_customer.id
      @address.save
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    end
  end


  def index
  end

  def show
  end
  private

  def address_params
    params.require(:order).permit(:postal_code, :address, :name)
  end

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end

end
