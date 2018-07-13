class NurseriesController < ApplicationController
	def index
		@nurseries = Nursery.all
		@user = current_user
		@search = Nursery.ransack(params[:q])
		@nurseries = @search.result
		# @hash = Gmaps4rails.build_markers(@nurseries) do |nursery, marker|
		# 	marker.lat nursery.latitude
		# 	marker.lng nursery.longitude
		# 	marker.infowindow nursery.name
		# 	marker.json({name: nursery.name})
		# end
	end

	def show
		@list_item = ListItem.new
		@nursery = Nursery.find(params[:id])
		@list_itema = ListItem.find_by(nursery_id: @nursery.id, user_id: current_user.id)
		@user = current_user
	end

	def new
		@admin = current_admin.id
		@nursery = Nursery.new
		@nursery.prices.build
	end

	def create
		admin = current_admin.id
		nursery = Nursery.new(nursery_params)
		nursery.save
		redirect_to root_path
	end

	def edit
		@admin = current_admin.id
		@nursery = Nursery.find(params[:id])
	end

	def update
		admin = current_admin.id
		nursery = Nursery.find(params[:id])
		nursery.update(nursery_params)
		redirect_to nurseries_path(nursery)
	end

	def destroy
		nursery = Nursery.find(params[:id])
  		nursery.destroy
  		redirect_to root_path
	end
private
  	def nursery_params
      	params.require(:nursery).permit(:admin_id, :name, :type, :nearest, :phone, :email,
      									 :price, :capacity, :date, :time, :url, :image, :concept, :concept_detail,
      									 :post_code, :address, :latidute, :longitude,
      									 prices_attributes: [:_destroy,:id, :nursery_id, :zero, :one, :twe, :three, :four, :five])
  	end
  	# def list_item_params
   #    	params.require(:list_item).permit(:user_id, :nursery_id)
  	# end
end
