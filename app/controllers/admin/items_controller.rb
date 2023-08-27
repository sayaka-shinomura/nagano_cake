class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(admin_item_params)
    if @item.save
      redirect_to admin_items_path(@item)
    else
      render :new
    end
  end



  def show
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price)
  end



end
