class RegistrationsController < ApplicationController
  def new
    @registration = Registration.new rider: params[:rider] != 'false'
    # flash.now[:warning] = "Registrations are now closed! On-site registrations are available, but excludes a t-shirt, pin and rally pack."
    # flash.now[:warning] = "Sorry folks! Due to an overwhelming response we have over 600 registrations and are unfortunately forced to closed registrations. We have no more space!"
  end

  def create
    # flash[:notice] = "Registrations are now closed! On-site registrations are available, but excludes a t-shirt, pin and rally pack."

    # In case it's full early
    # flash[:notice] = "Sorry folks! Due to an overwhelming response we have over 600 registrations and are unfortunately forced to closed registrations. We have no more space!"
    # redirect_to '/'

    # @registration = Registration.create registration_params.except(:authenticity_token)
    # if @registration.persisted?
    #   RegistrationsMailer.notify(@registration).deliver
    #   flash[:notice] = "Your registration has been submitted. We're sending you an email with the payment details and your reference number now."
    #   redirect_to '/'
    # else
    #   flash.now[:error] = "There was a problem with your registration and it wasn't saved. Please try again – or alternatively email route62rally@gmail.com."
    #   render :new
    # end
  end

  private

  def registration_params
    params.permit(
      :rider, :first_name, :last_name,
      :residential_address, :postal_address,
      :email, :contact_number, :alternate_contact_number,
      :motorcycle, :chapter, :shirt_size, :friday_meal,
      :payment_method, :terms_and_conditions,
      :authenticity_token
    )
  end
end
