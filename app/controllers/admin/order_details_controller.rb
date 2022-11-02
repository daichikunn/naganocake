class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
    # @orderdetail = OrderDetail.find(params[:id])→１つしかデータを持ってこれない、orderと同じものだけになる
    @order_details = @order.order_details

  end

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    @order = @order_detail.order
    @order_details = @order.order_details
    # @order_details.find(1) 複数の中から１つ探す
    if @order_details.any?{|order_detail| order_detail.making_status == "now_at_work"}
      @order.update(status: 2)
    elsif @order_details.all?{|order_detail| order_detail.making_status == "production_complete"}
      @order.update(status: 3)
    end



      # @order.update_all(status: 2) if @order_detail.making_status == "now_at_work"
      # @order.update_all(status: 3) if @order_details.making_status == "production_complete"



    # end
    redirect_to admin_order_path(@order_detail.order)
  end

private

  # def order_params
  #   params.require(:order).permit(:status)
  # end

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end