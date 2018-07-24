class PricesController < ApplicationController
	before_action :authenticate_admin!
	# def new
	# 	@search = Nursery.ransack(params[:q])
	# 	@nursery = Nursery.find(params[:id])
	# 	@price = Price.new
	# end

	def create
		price = Price.new(price_params)
		price.save
		redirect_to edit_price_path(price)
	end

	# def edit
	# 	@search = Nursery.ransack(params[:q])
	# 	@price = Price.find(params[:id])
	# 	@nursery = @price.nursery
	# end

	def update
		price = Price.find(params[:id])
		price.update(price_params)
		nursery = price.nursery
		redirect_to nurseries_path(nursery)
	end

	# def destroy
	# end
private
  	def price_params
      	params.require(:price).permit(:nursery_id, :title, :zero, :one, :twe, :three, :four, :five)
  	end
end
