class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @orders = Order.order(created_at: :desc).page(params[:page]).per(10)
    #kaminari+DSCの書き方@tasks = Task.order(created_at: :desc).page(params[:page]).per(10)
  end

end