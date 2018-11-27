# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Cart.destroy_all
User.destroy_all
Item.destroy_all

i = 0
20.times do 
    Item.create(title: "titre #{i}", description: "ceci est une description du produit n°#{i}", price: i, image: "ceci est l'image du produit n°#{i}")
    i += 1
end

#Création de 5 users ayant pour mot de passe 'topsecret' et de leur panier correspondant contenant tous les items
5.times do 
    user = User.create(email: Faker::Internet.email, password: 'topsecret', password_confirmation: 'topsecret')
    cart = Cart.create(user_id: user.id)
    i = Item.first.id
    Item.count.times do
        cart.items << Item.find(i)
        i += 1
    end
end
