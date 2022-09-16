class Users::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token, only: %i[new create destroy]
  respond_to :json

  private

  def respond_with(_resource, _opts = {})
    if current_user
      render json: {
        status: 200,
        message: 'You have succesfully logged in.'
      }, status: :ok
    else
      render json: {
        status: 401,
        message: 'Sorry, that account could not be logged in.'
      }, status: :unauthorized
    end
  end

  def respond_to_on_destroy
    if current_user
      render json: {
        status: 200,
        message: 'You have succesfully logged out.'
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "There isn't an active user session."
      }, status: :unauthorized
    end
  end
end
