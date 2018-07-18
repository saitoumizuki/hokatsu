class MemosController < ApplicationController
	def create
		memo = Memo.new(memo_params)
		memo.user_id = current_user.id
		memo.save
		redirect_to nurseries_path(nursery)
	end

	def update
		memo = Memo.find(params[:id])
		memo.update(memo_params)
		redirect_to nurseries_path(nursery)
	end
private
  	def memo_params
      	params.require(:memo).permit(:user_id, :body)
  	end
end
