class ListItemsController < ApplicationController
	def index
		@search = Nursery.ransack(params[:q])
		@list_items = ListItem.all
		@memo1 = Memo.find_by(user_id: current_user.id)
		@memo2 = Memo.new
		@memo2.user_id = current_user.id
	end

	# def show
	# end

	def create
		list_item = ListItem.new(list_item_params)
		list_item.user_id = current_user.id
		list_item.save
		@nursery = list_item.nursery
		@list_item = ListItem.new
		@list_itema = ListItem.find_by(nursery_id: @nursery.id, user_id: current_user.id)
		@user = current_user
		render :template => "nurseries/show"
	end

	# def edit
	# end

	# def update
	# end

	def destroy
		list_item = ListItem.find(params[:id])
		@nursery = list_item.nursery
		list_item.destroy
		@list_item = ListItem.new
		@list_itema = ListItem.find_by(nursery_id: @nursery.id, user_id: current_user.id)
		@user = current_user
		render :template => "nurseries/show"
	end

private
  	def list_item_params
      	params.require(:list_item).permit(:user_id, :nursery_id)
  	end
end
