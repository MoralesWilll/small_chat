class UserMailer < ApplicationMailer
    default from: ENV["EMAIL_USER"]

    def send_email(email, content)
      @email = email
      @content = content
      mail(to: @email, subject: "Tu pregunta de small-chat ha sido respondida")
    end
end
