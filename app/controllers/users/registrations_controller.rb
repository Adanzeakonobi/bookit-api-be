class Users::RegistrationsController < Devise::RegistrationsController
  include RackSessionFix

  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: {
        status: { code: 200,
                  message: 'Account successfully created!' },
        data: UserSerializer.new(resource).serializable_hash[:data][:attributes].merge(role: resource.role)
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
