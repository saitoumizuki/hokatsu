class NurseriesController < ApplicationController
	def index
		@nurseries = Nursery.all
		@user = current_user
		@spots = @user.spots.all
		@search = Nursery.ransack(params[:q])
		@nurseries = @search.result
		@ninka = @nurseries.where("category = '認可'")
		@ninsyo = @nurseries.where("category = '認証'")
		@gai = @nurseries.where("category = '認可外'")
		@sonota = @nurseries.where("category = 'その他'")
	end

	def show
		@nursery = Nursery.find(params[:id])
		if user_signed_in?
			@list_item = ListItem.new
			@list_itema = ListItem.find_by(nursery_id: @nursery.id, user_id: current_user.id)
			@user = current_user
		end
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
      	params.require(:nursery).permit(:admin_id, :name, :nearest, :phone, :email,
      									 :capacity, :date, :time, :holiday, :url, :post_code, :address, :latitude, :longitude, :category,
      									 prices_attributes: [:_destroy,:id, :nursery_id, :zero, :one, :twe, :three, :four, :five])
  	end
end
