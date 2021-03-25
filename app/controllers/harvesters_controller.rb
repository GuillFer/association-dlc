class HarvestersController < ApplicationController

  def show
    @harvester = Harvester.find(params[:id])
  end

	def create
    page = request.path
	  harvest = Harvest.find(params[:harvest_id])
    harvester = Harvester.new(user: current_user, harvest: harvest)
    harvester.save!
    redirect_back(fallback_location: root_path)
  end

  def destroy
    harvester = Harvester.find(params[:id])
    harvester.destroy
    redirect_back(fallback_location: root_path)
  end

end
