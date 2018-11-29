class HomeController < ApplicationController
  def index
  	@items = Item.all

  	@admin = User.find_by(admin: true)
  	puts "look hereeeeeeeeeeee"
  	puts @admin

  end

  def show
  	@item_id = Item.find(params[:id])
  end


  def admin

  end

  def profile
  	@orders = current_user.orders
  end

  def user_order
    @order = Order.find(params[:order_id])
  end


end
