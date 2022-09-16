class VehiclesController < ApplicationController
  load_and_authorize_resource

  def index
    if can? :manage, Vehicle
      render json: Vehicle.vehicles
    else
      render json: Vehicle.vehicles.where(visible: true)
    end
  end


  def vehicle_params
    params.require(:vehicle).permit(:name, :price, :image, :visible)
  end
end
