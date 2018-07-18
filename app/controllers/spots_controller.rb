class SpotsController < ApplicationController
	def index
		@spots = Spot.all
		@spot = Spot.new
	end

	# def new
	# end

	def create
		spot = Spot.new(spot_params)
		spot.save
		redirect_to spots_path
	end

	# def edit
	# end

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
