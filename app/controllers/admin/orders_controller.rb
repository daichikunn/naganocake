class Admin::OrdersController < ApplicationController


  def show
    @order = Order.find(params[:id])
    # @orderdetail = OrderDetail.find(params[:id])→１つしかデータを持ってこれない、orderと同じものだけになる
    @order_details = @order.order_details

  end


  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order)
  end



 private

  def order_params
    params.require(:order).permit(:status)
  end

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end