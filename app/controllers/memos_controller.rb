class MemosController < ApplicationController
	def create
	end

	def update
	end
private
  	def memo_params
      	params.require(:memo).permit(:user_id, :body)
  	end
end
