require 'openssl'

class UploadcareController < ApplicationController
  authorize_resource class: false

  def auth_params
    secret = Rails.application.config.uploadcare_private_key
    expire_at = Time.now + (60 * 10)
    render json: {
      signature: OpenSSL::HMAC.hexdigest('SHA256', secret, expire_at.to_i.to_s),
      expire: expire_at
    }
  end
end
