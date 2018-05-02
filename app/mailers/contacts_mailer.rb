class ContactsMailer < ApplicationMailer
  layout false

  def notify(contact)
    @contact = contact

    mail(
      to: [
        %("Bruce du Toit" <brucedt@iafrica.com>),
        %("Ammi du Toit" <ammi@iafrica.com>),
        %("Route 62 Rally <route62rally@gmail.com>")
      ],
      subject: "Route 62 Rally Contact Form Query",
      reply_to: %("#{contact.name} <#{contact.email}>")
    )
  end
end
