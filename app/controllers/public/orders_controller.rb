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
      # @order.status.key(0)





    elsif params[:order][:address_option] == "1"
      @order = Order.new(order_params)
        # セレクトボックスを使って、登録した配送先から選んでもらいたい
      @address = Address.find(params[:order][:address_id])
      @order.shipping_name = @address.name
      @order.shipping_postal_code = @address.postal_code
      @order.shipping_address = @address.address
      @order.shipping_fee = 800
      # @order.status = Order.status.key(0)



    else params[:order][:address_option] == "2"
      @order = Order.new(order_params)
      @order.shipping_fee = 800
      # @order.status = Order.status.key(0)
# 新しい住所を打ってほしい

    end
      @cart_item = current_customer.cart_items
      @total = 0
      @total_all = @order.billing_amount



  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save


    cart_items = current_customer.cart_items

    cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.amount = cart_item.amount
      @order_detail.price = cart_item.item.with_tax_price
      @order_detail.item_id = cart_item.item.id
      @order_detail.order_id = @order.id
      @order_detail.save
    end


    cart_items.destroy_all

  redirect_to orders_complete_path

  end

  def complete


  end






  def index
    @orders = Order.all

  end

  def show
    @order = Order.find(params[:id])
    @order_details =  @order.order_details
    @total = 0
    @order_details.each do |order_detail|
      @total += order_detail.amount * order_detail.price
    end


    # 注文に紐づいた内容を表示したい




  end


private

def order_params
params.require(:order).permit(:customer_id, :shipping_name, :shipping_postal_code, :shipping_address, :shipping_fee, :billing_amount, :payment_method)
end



end
