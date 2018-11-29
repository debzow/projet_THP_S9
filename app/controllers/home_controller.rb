class HomeController < ApplicationController
  def index
  	@items = Item.all
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
