class UserMailer < ApplicationMailer
    default from: "elivank@aol.com"

    def contact_form(email, name, message)
    @message = message
        mail(from: email,
            to: 'elivank@aol.com',
            subject: "A new contact form message from #{name}")
  end
end
