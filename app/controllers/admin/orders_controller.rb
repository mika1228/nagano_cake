class Admin::OrdersController < ApplicationController
  
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    @order_details = @order.order_details

    if @order.status == "1"
      @order_details.each do |order_detail|
        order_detail.makimg_status = "2"
        order_detail.save
      end
    end
    redirect_to admin_order_detail_path
  end
  
  private

  def order_params
    params.require(:order).permit(:status)
  end
  
end