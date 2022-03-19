class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end

  def update
    @item = item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_items_path
  end

  private
  def item_params
    params.require(:item).permit(:name, :explanation, :price, :is_active, :image)
  end
end