class HomeController < ApplicationController
  def index
  	@items = Item.all
  end

  def show
  	@item_id = Item.find(params[:id])
  end

  def profile
  	@order = current_user.orders
  end
end
