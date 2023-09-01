class Public::ItemsController < ApplicationController

  def index
     @items = Itemｖ
  end

  def show
    @item = Item.find(params[:id])
    @items = Item.all
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price)
  end
end
