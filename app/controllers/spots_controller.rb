class SpotsController < ApplicationController
	before_action :authenticate_user!
	def index
		@spots = current_user.spots.all.order(id: "DESC")
		@spot = Spot.new
		@search = Nursery.ransack(params[:q])
	end

	def create
		spot = Spot.new(spot_params)
		spot.save
		redirect_to spots_path
	end

	def update
		spot = Spot.find(params[:id])
		spot.update(spot_params)
		redirect_to spots_path
	end

	def destroy
		spot = Spot.find(params[:id])
  		spot.destroy
  		redirect_to spots_path
	end
private
  	def spot_params
      	params.require(:spot).permit(:user_id, :name, :detail, :post_code, :address, :latitude, :longitude)
  	end
end
