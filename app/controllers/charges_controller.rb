class ChargesController < ApplicationController

	def new
	end

	def create

		if user_signed_in?
      @cart = current_user.cart
			@cart_items = @cart.items

			#Creation of the order
			@order = Order.create(user_id: current_user.id)
			@cart_items.each do |item| 
				@order.items << item
			end
			
			#order value
			@order_value = 0
			@order.items.each do |item|
				@order_value += item.price
      end

			#re-initialize cart
			@cart_items.each do |item|
				if item.carts.find(@cart.id)
					item.carts.delete(@cart)
				end
			end

			#Send Email
			#ContactMailer.order(@order, current_user.email).deliver_now

	    else
	      redirect_to root_path
	    end

  		# Amount in cents
	  	@amount = @order_value * 100

	 	 customer = Stripe::Customer.create(
	    :email => params[:stripeEmail],
	    :source  => params[:stripeToken]
	  	)

	  	charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount.to_i,
	    :description => 'Downloading files',
	    :currency    => 'eur'
	  	)

		rescue Stripe::CardError => e
	 	flash[:error] = e.message
	  	redirect_to :root

	  	if Order.find_by(current_user.id)
	  		Cart.destroy
	  	end
	end
end
