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
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to request.referer, notice: "successfully"
    else
      render "edit"
    end
  end

  def quit
  end

  def out
  end

  def withdrawal
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  def unsubscribe
  end

  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:first_name_kana,:last_name_kana,:address,:phone_number,:postal_code,:email)
  end
end
