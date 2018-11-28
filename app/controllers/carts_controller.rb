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
    else
      redirect_to root_path
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
    #select item to remove from the cart
    item = Item.find(params["format"])
    #select the cart of the log-in user
    if user_signed_in?
      cart = current_user.cart
      #check if the item is in the cart
      if item.carts.find(cart.id)
        item.carts.delete(cart)
      end
      redirect_to carts_show_path
    else
      redirect_to root_path
    end
  end

  #re-initialize cart
  def reset
    if user_signed_in?
      cart = current_user.cart
      #remove all items from the cart
      cart.items.each do |item|
        #check if the item is in the cart
        if item.carts.find(cart.id)
          item.carts.delete(cart)
        end
      end
      redirect_to carts_show_path
    else
      redirect_to root_path
    end
  end

end
