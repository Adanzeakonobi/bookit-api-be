class VehiclesController < ApplicationController
  load_and_authorize_resource

  def index
    if can? :manage, @vehicle
      render json: Vehicle.vehicles
    else
      render json: Vehicle.vehicles.where(visible: true)
    end
  end

  def show
    render json: @vehicle
  end

  def create
    if can? :manage, @vehicle

      @vehicle = Vehicle.new(vehicle_params)
      if @vehicle.save
        render json: { message: 'Vehicle created succesfully' }
      else
        render json: @vehicle.errors, status: :unprocessable_entity
      end

    else
      render json: { message: 'You have no access to this resource' }
    end
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:name, :price, :image, :visible)
  end
end
