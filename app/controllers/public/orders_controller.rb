class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def check
    @order = Order.new(order_params)
    if params[:order][:address_option] == "0"
      #paramsはstringだから””で表示
      # customers.address を表示したい
      @order.address = current_customer.address

      elsif params[:order][:address_option] == "1"
        # セレクトボックスを使って、登録した配送先から選んでもらいたい
        @address = Address.finnd(params[:current_customer_id])
      else params[:order][:address_option] == "2"
        # 新しい住所を打ってほしい

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
