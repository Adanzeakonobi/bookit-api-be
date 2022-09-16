class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token, only: [:create]
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: {
        status: 200,
        message: 'Account successfully created!'
      }, status: :ok
    else
      error_list = resource.errors.full_messages.join(' and ').downcase

      render json: {
        status: 422,
        message: "Sorry, that account could not be created because #{error_list}."
      }, status: :unprocessable_entity
    end
  end
end
