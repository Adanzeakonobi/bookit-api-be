class ReservationsController < ApplicationController
  load_and_authorize_resource

  def index
    render json: Reservation.reservations(current_user.id)
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      render json: { message: 'Reservation was successfully created.' }
    else
      render json: { error: @reservation.errors[:vehicle_id][0] }, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:city, :date, :vehicle_id).merge(user_id: current_user.id)
  end
end
