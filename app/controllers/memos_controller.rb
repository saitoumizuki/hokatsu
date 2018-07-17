class MemosController < ApplicationController
	def create
		memo = Memo.new(memo_params)
		memo.user_id = current_user.id
		memo.save
	end

	def update
	end
private
  	def memo_params
      	params.require(:memo).permit(:user_id, :body)
  	end
end
