class NurseriesController < ApplicationController
	before_action :authenticate_admin!, except: [:index, :show, :about]
	def index
		@nurseries = Nursery.all.order(id: "DESC")
		@search = Nursery.ransack(params[:q])
		@nurseries = @search.result
		@ninka = @nurseries.where("category = '認可'")
		@ninsyo = @nurseries.where("category = '認証'")
		@gai = @nurseries.where("category = '認可外'")
		@sonota = @nurseries.where("category = 'その他'")
		# 「その他」が生かしきれていない感
		if user_signed_in?
		# ログインしている場合、ユーザーに紐づくスポットもマップに表示する。
			@user = current_user
			@spots = @user.spots.all
		end
	end

	def show
		@search = Nursery.ransack(params[:q])
		@nursery = Nursery.find(params[:id])
		if @nursery.phone.present? && @nursery.phone_middle.present? && @nursery.phone_right.present?
			@phone = @nursery.phone + @nursery.phone_middle + @nursery.phone_right
		end
		if user_signed_in?
			@user = current_user
			@list_item = ListItem.new
			# マイリストに追加する用
			@list_itema = ListItem.find_by(nursery_id: @nursery.id, user_id: current_user.id)
			# マイリストから削除する用、メモを追加・編集する用
			if @list_itema.present?
				# マイリストに登録している場合、メモ書きができるようにする。
				@list_memo1 = ListMemo.find_by(list_item_id: @list_itema.id)
				# メモが既に存在するなら、edit
				@list_memo2 = ListMemo.new
				# メモがないなら、create
				@list_memo2.list_item_id = @list_itema.id
				# list_memoの親はlist_item
			end
		end
	end

	def new
		@search = Nursery.ransack(params[:q])
		@admin = current_admin.id
		@nursery = Nursery.new
		@nursery.prices.build
		# priceも同時に作成する
	end

	def create
		admin = current_admin.id
		nursery = Nursery.new(nursery_params)
		if nursery.save
			redirect_to root_path
		else
			@search = Nursery.ransack(params[:q])
			@admin = current_admin.id
			@nursery = Nursery.new
			@nursery.prices.build
			render :new
		end
	end

	def edit
		@search = Nursery.ransack(params[:q])
		@admin = current_admin.id
		@nursery = Nursery.find(params[:id])
		@nursery.prices.build
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
	def about
		@search = Nursery.ransack(params[:q])
	end
private
  	def nursery_params
      	params.require(:nursery).permit(:admin_id, :name, :nearest, :phone, :phone_middle, :phone_right, :email,
      									 :capacity, :date, :time, :holiday, :url, :post_code, :address, :latitude, :longitude, :category,
      									 prices_attributes: [:_destroy, :id, :title, :nursery_id, :zero, :one, :twe, :three, :four, :five])
  	end
end
