class Public::OrdersController < ApplicationController

 def new
   @order = Order.new
 end

  def create
    order = Order.new(order_params)
    order.save
    cart_items = current_customer.cart_items
    cart_items.includes(:item).each do |cart_item|
      order_item = OrderItem.new
      order_item.item_id = cart_item.item_id
      order_item.order_id = order.id
      order_item.amount = cart_item.amount
      order_item.status = 0
      order_item.total = cart_item.amount * cart_item.item.price
      order_item.save
    end
    current_customer.cart_items.destroy_all
    redirect_to complete_orders_path
  end

  def confirm
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    @order = Order.new(order_params)
    @order.shipping_fee = FEE
    @order.customer_id = current_customer.id
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
    params.require(:order).permit(:payment_method, :postal_code, :address, :name,:customer_id, :shipping_fee, :status)
  end

end
