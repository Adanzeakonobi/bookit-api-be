class ReservationsController < ApplicationController
  load_and_authorize_resource

  def index
    render json: Reservation.where(id: current_user.id)
  end
end
