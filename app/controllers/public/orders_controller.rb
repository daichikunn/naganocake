class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def check

    if params[:order][:address_option] == "0"
      #paramsはstringだから””で表示
      # customers.address を表示したい
      @order = Order.new(order_params)
      @order.shipping_name = current_customer.full_name
      @order.shipping_postal_code = current_customer.postal_code
      @order.shipping_address = current_customer.address
      @order.shipping_fee = 800


      elsif params[:order][:address_option] == "1"
      @order = Order.new(order_params)
        # セレクトボックスを使って、登録した配送先から選んでもらいたい
      @address = Address.find(params[:order][:address_id])
      @order.shipping_name = @address.name
      @order.shipping_postal_code = @address.postal_code
      @order.shipping_address = @address.address
      @order.shipping_fee = 800

      else params[:order][:address_option] == "2"
      @order = Order.new(order_params)
      @order.shipping_fee = 800

        # 新しい住所を打ってほしい

      end
      @cart_item = current_customer.cart_items
      @total = 0
      @total_all = @order.billing_amount


  end

  def complete

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
