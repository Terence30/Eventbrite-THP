class AdminMailer < ApplicationMailer
  default from: 'no-reply@eventbrite-thpp.fr'
 
  def new_participant(admin)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @admin = admin.event.admin

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://eventbrite-thpp.herokuapp.com' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @admin.email, subject: 'Nouveau participant') 
  end
end
