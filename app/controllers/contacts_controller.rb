class ContactsController < ApplicationController
  def create
    if Contact.create contact_params
      flash[:notice] = "Your request has been sent. Someone will get back to you as soon as possible with a response, if needed."
    else
      flash[:error] = "There was a problem sending your message. Please try again – or alternatively email route62rally@gmail.com."
    end
    redirect_to '/'
  end

  private

  def contact_params
    params.permit :name, :email, :message
  end
end
