class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end

  def index
    @items = Item.all
    @page_items = Item.page(params[:page]).per(10)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end
  
  private 
  
  def item_params
    params.require(:item).permit(:id, :image, :name, :introduction,  :price, :is_active, :genre_id)
  end

end
