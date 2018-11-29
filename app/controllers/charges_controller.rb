class ChargesController < ApplicationController

	def new
	end

	def create
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

  		# Amount in cents
	  	@amount = @cart_value * 100

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
		end

end
