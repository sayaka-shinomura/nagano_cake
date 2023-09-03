class Public::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page]).per(8)
    @item = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @items = Item.all
    @cart_item = CartItem.new
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price)
  end


end
