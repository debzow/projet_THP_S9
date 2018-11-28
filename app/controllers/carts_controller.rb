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
    if user_signed_in?
      cart = current_user.cart
      item = Item.find(params["item_id"])
      @item_id = item.id
      if cart.items << item
        @items_number = cart.items.count
        puts "#"*20
        puts @item_id 
        respond_to do |format|
          format.html { redirect_to root_path }
          format.js
          #Display an SUCCESS mesage      
          #flash[:notice] = "Item succesfuly added"
        end
      else
        #Display an ERR message
      end
    else
      redirect_to root_path
    end
  end

  #remove item from the cart
  def remove_item
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
  end
end
