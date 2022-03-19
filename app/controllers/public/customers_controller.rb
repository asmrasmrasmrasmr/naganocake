class Public::CustomersController < ApplicationController
# before_action :ensure_corrent_customer
  # def ensure_correct_user
  #   @customer = Customer.find(params[:id])
  #   if current_customer != @customer
  #     flash[:notice]="権限がありません"
  #     redirect_to request.referer
  #   end
  # end
  #会員のアクションをする前に現在の会員とアクションしようとする会員が一緒か確認

  def show
    #@customer = Customer.find(params[:id])
    @customer = current_customer

  end

  def edit
    @customer = current_customer
  end

  def update
  end

  def quit
  end

  def out
  end
end
