class PricesController < ApplicationController
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
  	def price_params
      	params.require(:price).permit(:nursery_id, :zero, :one, :twe, :three, :four, :five)
  	end
end
