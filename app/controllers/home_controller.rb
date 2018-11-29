class HomeController < ApplicationController
  def index
    @items = Item.all
    
    @cart_items_id = []
    if user_signed_in?
      current_user.cart.items.each do |item|
        @cart_items_id << item.id
      end
    end
  end

  def show
  	@item_id = Item.find(params[:id])
  end

  def profile
  	@orders = current_user.orders
  end

  def user_order
    @order = Order.find(params[:order_id])
  end

end
