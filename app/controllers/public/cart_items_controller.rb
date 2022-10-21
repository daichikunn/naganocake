class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @total = 0
  end

  def create
    @cart_item = Cart_item.new(cart_item_params)
    @cart_item.save

  end

  def destroy
  

  end

  def update

  end

  def destroy_all
    Cart_item.destroy_all
    redirect_to cart_items_path
  end
  

 private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end
