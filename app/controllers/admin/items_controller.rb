class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item.id)
  end

  def index
    @items = Item.all
    @items = Item.page(params[:page]).per(10)
  end

  def show
  end

  def edit
  end

  def update
  end
  
  private 
  
  def item_params
    params.require(:item).permit(:id, :name, :price, :is_active)
  end

end
