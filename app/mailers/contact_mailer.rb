class ContactMailer < ApplicationMailer

    def welcome(name, email) 
        @user_name = name
        @user_email = email 
        mail(to: @user_email, subject:'sujet bienvenue de test')
    end

    def order(ordered, email)
        @amazonaws = 'https://s3.eu-west-3.amazonaws.com/fishstor/'
        @items = ordered.items
        mail(to: email, subject:'votre commande')
    end

end
