class AttendanceMailer < ApplicationMailer

  default from: 'no-reply@monsite.fr'  

  def confirmation_email(admin)
    @admin = admin

    @url  = 'http://monsite.fr/login' 

    mail(to: @admin.email, subject: 'Ce user s"est inscrit à cet évènement !') 

  end

end
