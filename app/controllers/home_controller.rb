class HomeController < ApplicationController
  def index
  	@items = Item.all

  end

  def show
  	@item_id = Item.find(params[:id])

  	puts "LOOOOOOOOOK HEEEEEREEEEEEEE"
  	puts params 
  	puts "@item_id : #{@item_id}" 
  	puts @item_id.image
  
  end
end
