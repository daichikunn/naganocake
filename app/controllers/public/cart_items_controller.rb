class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @cart_items = current_customer.cart_items
    @total = 0
  end

  def create
    @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    if @cart_item
      @cart_item.amount += CartItem.new(cart_item_params).amount
    else
      @cart_item = current_customer.cart_items.new(cart_item_params)
    end
    @cart_item.save

    redirect_to cart_items_path

    #商品の種類とカート内

  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    # @cart_item = current_customer.cart_items.find_by(amount: params[:cart_item][:amount])

    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end


 private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end
