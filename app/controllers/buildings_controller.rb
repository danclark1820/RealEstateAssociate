class BuildingsController < ApplicationController

  def new
    @building = Building.new
  end

  def create
    @building = Building.new(building_params)
    if @building.save
      redirect_to new_building_path
      flash[:notice] = "Successfully added building"
    else
      redirect_to new_building_path(@building)
      flash[:notice] = "Please fill out required fields"
    end
  end

  def building_params
    params.require(:building).permit(:address, :city, :state, :zip, :description, :owner_id)
  end
end
