class ListItemsController < ApplicationController
	before_action :authenticate_user!
	def index
		@search = Nursery.ransack(params[:q])
		@list_items = current_user.list_items.all.order("row_order")
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
		@search = Nursery.ransack(params[:q])
		render :template => "nurseries/show"
	end

	# def edit
	# end

	def update
		list_item = ListItem.find(params[:id])
		list_item.update(list_item_params)
		redirect_to list_items_path
	end

	def destroy
		list_item = ListItem.find(params[:id])
		# destroyの前に@nurseryを取得しておく
		@nursery = list_item.nursery
		list_item.destroy
		# list_itemの並び順を更新する
		# list_items = current_user.list_items.all
		# 	list_items.each do |list_item|
		# 		list_item.row_order = list_items.count + 1
		# 		list_item.save
		# 	end
		# nursery/showを表示する
		@list_item = ListItem.new
		@list_itema = ListItem.find_by(nursery_id: @nursery.id, user_id: current_user.id)
		@user = current_user
		@search = Nursery.ransack(params[:q])
		render :template => "nurseries/show"
	end

private
  	def list_item_params
      	params.require(:list_item).permit(:user_id, :nursery_id, :row_order)
  	end
end
