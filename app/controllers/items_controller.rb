class ItemsController < ApplicationController
  def index
    @items = Item.all.order('created_at DESC')
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(product_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
end
