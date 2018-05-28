class ContactsMailer < ApplicationMailer
  layout false

  def notify(contact)
    @contact = contact

    mail(
      to: ['brucedt@iafrica.com', 'ammi@iafrica.com', 'route62rally@gmail.com'],
      subject: "Route 62 Rally Contact Form Query",
      reply_to: %("#{contact.name} <#{contact.email}>")
    )
  end
end
