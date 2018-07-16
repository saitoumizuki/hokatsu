class ListItemsController < ApplicationController
	def index
		@list_items = ListItem.rank(:row_order)
	end

	# def show
	# end

	def create
		list_item = ListItem.new(list_item_params)
		list_item.user_id = current_user.id
		list_item.save
		redirect_to list_items_path, notice: "マイリストに追加されました"
	end

	# def edit
	# end

	# def update
	# end

	def destroy
		list_item = ListItem.find(params[:id])
		list_item.destroy
		redirect_to list_items_path, notice: "削除されました。"
	end

	def sort
		list_item = ListItem.find(params[:list_item_id])
		list_item.update(list_item_params)
		render nothing: true
	end

private
  	def list_item_params
      	params.require(:list_item).permit(:user_id, :nursery_id, :row_order_position)
  	end
end
