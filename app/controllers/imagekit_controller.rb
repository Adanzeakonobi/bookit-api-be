class ImagekitController < ApplicationController
  authorize_resource class: false

  def auth_params
    render json: ImageKitIo.client.get_authentication_parameters
  end
end
