class Public::HomesController < ApplicationController

  def top
    @item = Item.new
    # 新着商品を上から4件取得
    @items_latest4 = Item.order(created_at: :desc).first(4)
    # 新着商品4件を除く全商品を取得
    @items_offset4 = Item.order(created_at: :desc).offset(4)
  end

  def about
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :price)
  end

end