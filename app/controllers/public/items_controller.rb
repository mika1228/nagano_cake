class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!, only: [:show]
  
  def index
    @items = Item.all
    @items = Item.page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem
  end
  
  private
  
  def item_params
    params.require(:item).permit(:image_id, :name, :introduction, :price)
  end

end
