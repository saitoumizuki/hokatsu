class SpotsController < ApplicationController
	def index
	end

	def new
	end

	def create
	end

	def edit
	end

	def update
	end

	def destroy
	end
private
  	def spot_params
      	params.require(:spot).permit(:user_id, :name, :detail, :post_code, :address, :latidute, :longitude)
  	end
end
