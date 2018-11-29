# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Cart.destroy_all
Order.destroy_all
User.destroy_all
Item.destroy_all


i = 1
	8.times do
    Item.create(title: "titre #{i}", description: "ceci est une description du produit n°#{i}", price: i, image: "p-#{i}.jpg")
    i += 1
end

# User Admin
1.times do
    User.create(email: "team_thp_mtp@admin.fr", password: 'topsecret', password_confirmation: 'topsecret', admin: true)
end

5.times do
    #Creation of a user with the password 'topsecret'
    User.create(email: Faker::Internet.email, password: 'topsecret', password_confirmation: 'topsecret', admin: false)

    #creation of a cart related to the user
    # cart = Cart.create(user_id: user.id)
    #creation of a order related to the user
    # order = Order.create(user_id: user.id)
    #Load of the cart and the order with items
    # i = Item.first.id
    # Item.count.times do
    #     cart.items << Item.find(i)
    #     order.items << Item.find(i)
    #     i += 1
    # end


end
