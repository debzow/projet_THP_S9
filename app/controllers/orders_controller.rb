class OrdersController < ApplicationController
  def create
    if user_signed_in?
      @cart = current_user.cart

      @order = Order.new

      #inject cart item into order
      @cart.items.each do |item|
        @order << item
      end


      @order_value = 0
      @order.items.each do |item|
        @order_value += item.price
      end

      #re-initialize cart
      @cart.reset

      #redirected to order create

      end
    else
      redirect_to root_path
    end
    
  end
end
