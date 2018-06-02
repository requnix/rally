class RegistrationsController < ApplicationController
  def new
    @registration = Registration.new(rider: (params[:rider] != 'false') || true)
  end

  def create
    @registration = Registration.create registration_params.except(:authenticity_token)
    if @registration.valid?
      RegistrationsMailer.notify(@registration).deliver!
      flash[:notice] = "Your registration has been submitted. We're sending you an email with the payment details and your reference number now."
      redirect_to '/'
    else
      flash.now[:error] = "There was a problem with your registration and it wasn't saved. Please try again – or alternatively email route62rally@gmail.com."
      render :new
    end
  end

  private

  def registration_params
    params.permit(
      :rider, :first_name, :last_name,
      :residential_address, :postal_address,
      :email, :contact_number, :alternate_contact_number,
      :motorcycle, :chapter, :shirt_size,
      :payment_method, :terms_and_conditions,
      :authenticity_token
    )
  end
end
