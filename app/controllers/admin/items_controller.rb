class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(product_params)
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
  
  
  
end
