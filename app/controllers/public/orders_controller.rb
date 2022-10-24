class Public::OrdersController < ApplicationController

  def new
    @order = Order.new(order_params)
  end

  def check
    @order = Order.new(order_params)
    if @order.invalid?
      render :new
    end
  end

  def complete
    Order.create!(order_params)
  end






  def index

  end

  def show
  end


private

def order_params
params.require(:order).permit(:customer_id, :shipping_name, :shipping_postal_code, :shipping_address, :shipping_fee, :billing_amount, :payment_method, :status)
 end



end
