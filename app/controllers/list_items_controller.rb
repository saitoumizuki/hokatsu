class ListItemsController < ApplicationController
	def index
	end

	def show
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
  	def list_item_params
      	params.require(:list_item).permit(:user_id, :nursery_id)
  	end
end
