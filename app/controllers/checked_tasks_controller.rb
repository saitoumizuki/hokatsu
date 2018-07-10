class CheckedTasksController < ApplicationController
	def create
	end

	def destroy
	end

private
  	def checked_task_params
      	params.require(:checked_task).permit(:user_id, :body)
  	end
end
