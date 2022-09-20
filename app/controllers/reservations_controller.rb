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
      @errors = @reservation.errors.full_messages[0..].join('. ')
      render json: { error: @errors }, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:city, :date, :vehicle_id).merge(user_id: current_user.id)
  end
end
