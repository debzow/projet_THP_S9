class CartsController < ApplicationController

  #show all items of the cart
  def show
    #select the cart of the log-in user
    if user_signed_in?
      @cart = current_user.cart
      @cart_items = @cart.items

      @cart_value = 0
      @cart_items.each do |item|
        @cart_value += item.price
      end
    end
  end

  def create
  end

  #add item to the cart
  def add_item
    #params[item_id]
  end

  #remove item from the cart
  def remove_item
    #params[item_id]
  end

  #re-initialize cart
  def reset
  end
end
