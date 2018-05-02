class ContactsMailerPreview < ActionMailer::Preview
  def notify
    ContactsMailer.notify Contact.first
  end
end
