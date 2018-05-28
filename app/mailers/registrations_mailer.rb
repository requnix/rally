class RegistrationsMailer < ApplicationMailer
  layout false

  def notify(registration)
    @registration = registration

    mail(
      to: registration.email,
      subject: "Route 62 Rally #{registration.year} Registration (#{registration.reference})",
      reply_to: %("Route 62 Rally <route62rally@gmail.com>"),
      bcc: ['brucedt@iafrica.com', 'ammi@iafrica.com', 'route62rally@gmail.com']
    )
  end
end
