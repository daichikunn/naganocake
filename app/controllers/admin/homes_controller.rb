class Admin::HomesController < ApplicationController
  def top
    # @order = Order.find(params[:id])
    @orders = Order.page(params[:page])
    # @order = Order.find(params[:id])
    # @order_details =  @order.order_details
    # @amount_total = 0
    # # @order_details.each do |order_detail|
    # @amount_total += order_detail.amount
    end

end
