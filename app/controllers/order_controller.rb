class OrderController < ApplicationController
  def show
  	if user_signed_in?
      @order = Order.create(user_id: current_user.id)
      @cart = current_user.cart
      @cart_items = @cart.items

      @cart_value = 0
      @cart_items.each do |item|
        @cart_value += item.price
      end
    else
      redirect_to root_path
    end
  end
end
