class AdminsController < ApplicationController
	before_action :authenticate_admin!

	def index
		@search = Nursery.ransack(params[:q])
		@users = User.all
		@admins = Admin.all
	end

  	def show
  		@search = Nursery.ransack(params[:q])
		@admin = Admin.find(params[:id])
	end

	def edit
		@search = Nursery.ransack(params[:q])
		@admin = Admin.find(params[:id])
	end

	def update
		admin = Admin.find(params[:id])
      	if admin.update(admin_params)
      		redirect_to admin_path(admin)
      	else
      		render :edit
      	end
	end

	# def admin_password_edit
	# 	if admin_signed_in?
	# 		@admin = Admin.find(params[:id])
	# 	else
	# 		redirect_to root_path, notice: "無効なURLです。"
	# 	end
	# end
	def destroy
		admin = Admin.find(params[:id])
  		admin.destroy
  		redirect_to root_path
	end

private
  	def admin_params
      	params.require(:admin).permit(:name, :email, :password)
  	end
end
