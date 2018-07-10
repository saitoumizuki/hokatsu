class NurseriesController < ApplicationController
	def index
	end

	def show
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
  	def nursery_params
      	params.require(:nursery).permit(:admin_id, :name, :type, :nearest, :phone, :email,
      									 :price, :capacity, :date, :time, :url, :concept, :concept_detail,
      									 :post_code, :address, :latidute, :longitude)
  	end
end
