class MemosController < ApplicationController
	before_action :authenticate_user!
	def create
		memo = Memo.new(memo_params)
		memo.user_id = current_user.id
		memo.save
		redirect_to list_items_path
	end

	def update
		memo = Memo.find(params[:id])
		memo.update(memo_params)
		redirect_to list_items_path
	end
private
  	def memo_params
      	params.require(:memo).permit(:user_id, :body)
  	end
end
