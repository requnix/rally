class RegistrationsMailerPreview < ActionMailer::Preview
  def notify
    registration = Registration.first
    RegistrationsMailer.notify registration
  end
end
