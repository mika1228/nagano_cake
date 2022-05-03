class Public::ItemsController < ApplicationController
  
  def index
    @items = Item.where(is_active: true)
    @items = Item.where(is_active: true).page(params[:page]).per(8)
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
