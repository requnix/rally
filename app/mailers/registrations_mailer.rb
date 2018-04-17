class RegistrationsMailer < ApplicationMailer
  layout false

  def notify(registration)
    @registration = registration

    mail(
      to: %("#{registration.first_name} #{registration.last_name}" <#{registration.email}>),
      subject: "Route 62 Rally #{registration.year} Registration (#{registration.reference})",
      reply_to: %("Route 62 Rally <route62rally@gmail.com>"),
      bcc: [
        %("Bruce du Toit" <brucedt@iafrica.com>),
        %("Ammi du Toit" <ammi@iafrica.com>),
        %("Route 62 Rally <route62rally@gmail.com>")
      ]
    )
  end
end
