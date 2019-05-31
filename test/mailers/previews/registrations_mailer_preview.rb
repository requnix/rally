class RegistrationsMailerPreview < ActionMailer::Preview
  def notify
    registration = Registration.first
    # registration.friday_meal = true
    RegistrationsMailer.notify registration
  end
end
