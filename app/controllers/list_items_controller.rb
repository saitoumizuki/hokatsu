class ListItemsController < ApplicationController
	before_action :authenticate_user!
	def index
		@search = Nursery.ransack(params[:q])
		@list_items = current_user.list_items.all.order("row_order")
		# ユーザーに紐づくリストアイテムをすべて取り出し、並び順(row_order)で並べる
		@memo1 = Memo.find_by(user_id: current_user.id)
		# メモが既にあるなら編集
		@memo2 = Memo.new
		# メモがないなら新規作成
		# @memo2.user_id = current_user.id
	end

	def create
		list_item = ListItem.new(list_item_params)
		list_item.user_id = current_user.id
		list_item.save
		# "nurseries/show"を生成するための変数
		@nursery = list_item.nursery
		@list_item = ListItem.new
		@list_itema = ListItem.find_by(nursery_id: @nursery.id, user_id: current_user.id)
		@user = current_user
		@search = Nursery.ransack(params[:q])
		if @list_itema.present?
			@list_memo1 = ListMemo.find_by(list_item_id: @list_itema.id)
			@list_memo2 = ListMemo.new
			@list_memo2.list_item_id = @list_itema.id
		end
		render :template => "nurseries/show"
	end

	def update
		list_item = ListItem.find(params[:id])
		list_item.update(list_item_params)
		redirect_to list_items_path
	end

	def destroy
		list_item = ListItem.find(params[:id])
		@nursery = list_item.nursery
		# destroyの前に@nurseryを取得しておく
		list_item.destroy

		# "nurseries/show"を生成するための変数
		@user = current_user
		@search = Nursery.ransack(params[:q])
		@list_item = ListItem.new
		@list_itema = ListItem.find_by(nursery_id: @nursery.id, user_id: current_user.id)
		if @list_itema.present?
			@list_memo1 = ListMemo.find_by(list_item_id: @list_itema.id)
			@list_memo2 = ListMemo.new
			@list_memo2.list_item_id = @list_itema.id
		end
		render :template => "nurseries/show"
	end

private
  	def list_item_params
      	params.require(:list_item).permit(:user_id, :nursery_id, :row_order)
  	end
end
