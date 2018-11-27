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
    item = Item.find(params["format"])
    #select the cart of the log-in user
    if user_signed_in?
      cart = current_user.cart
      #check if the item is in the cart
      if item.carts.find(cart.id)
        item.carts.delete(cart)
      end

    redirect_to carts_show_path
    end

  end

  def remove_post_from_category

    post = Post.find(params[:post][:id])
    category = post.categories.find(params[:category][:id])

    if category
       post.categories.delete(category)
    end

 end

  #re-initialize cart
  def reset
  end
end
