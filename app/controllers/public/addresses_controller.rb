class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
#3/19崎田　配送先登録・一覧のため追記

  def index
    @address = Address.new
    @addresses = Address.where(customer_id:current_customer)
    @customer = current_customer
  end

  def create
    address = Address.new(address_params)
    address.customer_id = current_customer.id
    address.save
    redirect_to request.referer
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to request.referer
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to addresses_path,notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :address,:name)
  end


end
