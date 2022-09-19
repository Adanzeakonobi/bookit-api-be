class ReservationsController < ApplicationController
  load_and_authorize_resource

  def index
    render json: Reservation.where(user_id: current_user.id)
  end
end
