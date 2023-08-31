class Public::ItemsController < ApplicationController

  def index
    @items = get_items(params)
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def get_items(params)

    params.require(:items).permit(:image, :name, :introduction, :price)
  end
end
