class ReservationsController < ApplicationController
  load_and_authorize_resource

  def index
    render json: Reservation.reservations(current_user.id)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:city, :date, :vehicle_id).merge(user_id: current_user.id)
  end
end
