class Public::ItemsController < ApplicationController

  #3/20 商品の販売ステータスが販売中であれば商品一覧に表示させる
  def index
    @items = Item.where(is_active: true)
  end

  def show
    @item = Item.find(params[:id])

  #3/20もし商品の販売ステータスが販売停止（unless）であればリダイレクトさせない
    redirect_to items_path and return unless @item.is_active

    ## @cart_item = Cart_Item.new

  end

end
