class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
		if User.exists?(id: params[:id])
			if user_signed_in?
				@user = User.find(params[:id])
			elsif admin_signed_in?
				@user = User.find(params[:id])
			else
				redirect_to root_path
			end
		else
			redirect_to root_path, notice: "無効なURLです。"
		end
	end

	def edit
		if User.exists?(id: params[:id])
			if user_signed_in?
				@user = User.find(params[:id])
			elsif admin_signed_in?
				@user = User.find(params[:id])
			else
				redirect_to root_path, notice: "無効なURLです。"
			end
		else
			redirect_to root_path, notice: "無効なURLです。"
		end
	end

	def update
		if user_signed_in?
			@user = User.find(params[:id])
	     	if @user.update(user_params)
	        	redirect_to user_path(@user.id), notice: "更新できました。"
	    	else
	      		render :edit
	    	end
	    else admin_signed_in?
	    	@user = User.find(params[:id])
	     	if @user.update(user_params)
	        	redirect_to user_path(@user.id)
	    	else
	      		render :edit
	    	end
	    end
	end

	def destroy
		if user_signed_in?
			user = User.find(params[:id])
	  		user.destroy
	  		redirect_to root_path, notice: "退会しました。"
	  	else admin_signed_in?
	  		user = User.find(params[:id])
	  		user.destroy
	  		redirect_to users_path
	  	end
	end

private
  	def user_params
      	params.require(:user).permit(:name, :email, :password, :post_code, :address, :latitude, :longitude)
  	end
end
