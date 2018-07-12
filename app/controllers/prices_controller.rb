class PricesController < ApplicationController
	def new
		@nursery = Nursery.find(params[:id])
		@price = Price.new
	end

	def create
		price = Price.new(price_params)
		price.save
		redirect_to edit_price_path(price)
	end

	def edit
		@price = Price.find(params[:id])
		@nursery = @price.nursery
	end

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
      	params.require(:price).permit(:nursery_id, :zero, :one, :twe, :three, :four, :five)
  	end
end
