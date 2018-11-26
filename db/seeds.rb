# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

i = 0
20.times do 
    Item.create(title: "titre #{i}", description: "ceci est une description du produit n°#{i}", price: i, image: "ceci est l'image du produit n°#{i}")
    i += 1
end