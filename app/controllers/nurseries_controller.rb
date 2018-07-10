class NurseriesController < ApplicationController
	def index
		@nurseries = Nursery.all
	end

	def show
		@nursery = Nursery.find(params[:id])
		@hash = Gmaps4rails.build_markers(@nursery) do |nursery, marker|
			marker.lat nursery.latitude
			marker.lng nursery.longitude
			marker.infowindow nursery.name
		end
	end

	def new
		@admin = current_admin.id
		@nursery = Nursery.new
	end

	def create
		nursery = Nursery.new
		nursery.save
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
