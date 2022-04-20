class Public::CartController < ApplicationController
  before_action :set_cart_item, only: [:add_item, :destroy]
  before_action :set_customer
  before_action :set_cart_item
  
  def show
    @cart_items = @cart.cart_items
  end
  
  def add_item
    @cart_item = @cart.cart_items.build(item_id: params[:item_id]) if @cart_item.blank?
    @cart_item.amount += params[:amount].to_i
    if @cart_item.save
      redirect_to current_cart
    end
  end

end
