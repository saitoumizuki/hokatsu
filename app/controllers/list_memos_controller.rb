class ListMemosController < ApplicationController
		before_action :authenticate_user!
	def create
		list_memo = ListMemo.new(list_memo_params)
		list_memo.save
		# "nurseries/show"を生成するための変数
		@nursery = list_memo.list_item.nursery
		@search = Nursery.ransack(params[:q])
		@user = current_user
		@list_item = ListItem.new
		@list_itema = ListItem.find_by(nursery_id: @nursery.id, user_id: current_user.id)
		@list_memo1 = ListMemo.find_by(list_item_id: @list_itema.id)
		@list_memo2 = ListMemo.new
		@list_memo2.list_item_id = @list_itema.id
		render :template => "nurseries/show"
	end

	def update
		list_memo = ListMemo.find(params[:id])
		list_memo.update(list_memo_params)
		# "nurseries/show"を生成するための変数
		@nursery = list_memo.list_item.nursery
		@search = Nursery.ransack(params[:q])
		@user = current_user
		@list_item = ListItem.new
		@list_itema = ListItem.find_by(nursery_id: @nursery.id, user_id: current_user.id)
		@list_memo1 = ListMemo.find_by(list_item_id: @list_itema.id)
		@list_memo2 = ListMemo.new
		@list_memo2.list_item_id = @list_itema.id
		render :template => "nurseries/show"
	end
private
  	def list_memo_params
      	params.require(:list_memo).permit(:list_item_id, :body)
  	end
end
