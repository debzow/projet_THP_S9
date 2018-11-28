class HomeController < ApplicationController
  def index
  end

  def email 
    # Version BDD
    #   si on veux configurer dans la view email, ou positionner les differentes infos
    #   du produit acheté il faut :
    #     * placer en valeur de product le produit entier (titre, description, prix, etc.)
    @product = Item.last
    ContactMailer.contact(@product.title).deliver_now
    # Version de test
    # attachments['p-1.jpg'] = File.read('app/assets/images/p-1.jpg')
  end
end
