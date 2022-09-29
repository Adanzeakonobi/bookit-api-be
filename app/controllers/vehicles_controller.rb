class VehiclesController < ApplicationController
  load_and_authorize_resource

  rescue_from ActiveRecord::RecordNotFound do |_exception| # for vehicles not found
    @vehicle = nil
    render json: { error: 'Sorry, that vehicle does not exist or is unavailable.' }
  end

  def index
    if can? :manage, @vehicle
      render json: Vehicle.vehicles('admin')
    else
      render json: Vehicle.vehicles('user')
    end
  end

  def show
    if can?(:manage, @vehicle) || @vehicle.visible
      render json: @vehicle.as_json.merge({ reservations: @vehicle.reservations })
    else
      render json: { error: 'Sorry, you do not have access to this vehicle.' }
    end
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    if !image_exists?(@vehicle.image)
      render json: { error: 'Please, check the image format.' }, status: :unprocessable_entity
    elsif @vehicle.save
      render json: { message: 'Vehicle created succesfully' }
    else
      @errors = @vehicle.errors.full_messages[0..].join('. ')
      render json: { error: @errors }, status: :unprocessable_entity
    end
  end

  def update
    @vehicle.update!(vehicle_params)
    render json: { message: 'Vehicle updated succesfully' }
  rescue StandardError
    @errors = 'Could not update the vehicle'
    render json: { error: @errors }, status: :unprocessable_entity
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:name, :price, :image, :visible)
  end
end
