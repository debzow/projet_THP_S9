class ContactMailer < ApplicationMailer
    def contact(content)
        @content = content 
        mail(to: "test@mail.fr", subject: "sujet de test")
    end
end
