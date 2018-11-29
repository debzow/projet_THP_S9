class ContactMailer < ApplicationMailer
    def welcome(name, email) 
        @user_name = name
        @user_email = email 
        mail(to: @user_email, subject:'sujet bienvenue de test')
    end
    def order(ordered, email)
        @order = ordered 
        @email = email
        mail(to: @email, subject:'votre commande')
    end
end
