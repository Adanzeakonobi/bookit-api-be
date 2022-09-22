class SwagController < ActionController::API
  def api
    redirect_to '/api-docs'
  end
end
