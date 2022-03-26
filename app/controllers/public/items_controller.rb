class Public::ItemsController < ApplicationController

  #3/20 商品の販売ステータスが販売中であれば商品一覧に表示させる
  def index
    @items = Item.where(is_active: true).page(params[:page]).per(8)
    @genres = Genre.all
    @items_all = Item.all
  end

  def show
    @item = Item.find(params[:id])

  #3/20もし商品の販売ステータスが販売停止（unless）であればリダイレクトさせない
    # redirect_to items_path and return unless @item.is_active
    @genres = Genre.all
    @cart_item = CartItem
  end

  private
  def item_params
    params.repuire(:item).permit(:genre_id, :name, :explanation, :image, :price)
  end

end
