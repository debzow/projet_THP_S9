class OrderController < ApplicationController
  def show
    if user_signed_in?
      @order = Order.find(params['order_id'])
      #order value
      @order_value = 0
			@order.items.each do |item|
				@order_value += item.price
      end
    else
      redirect_to root_path
    end
  end

  def new
    if user_signed_in?
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
