class UsersController < ApplicationController
	def index
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end

private
  	def user_params
      	params.require(:user).permit(:name, :email, :password, :post_code, :address, :latitude, :longitude)
  	end
end
