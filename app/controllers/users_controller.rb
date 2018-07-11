class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		user = User.find(params[:id])
     	if user.update(user_params)
        	redirect_to user_path(user), notice: "ユーザー情報を更新しました"
    	else
      		render :edit
    	end
	end

	def destroy
		user = User.find(params[:id])
  		user.destroy
  		redirect_to root_path, notice: "アカウントを削除しました"
	end

private
  	def user_params
      	params.require(:user).permit(:name, :email, :password, :post_code, :address, :latitude, :longitude)
  	end
end
