class TasksController < ApplicationController
	def create
	end

	def update
	end

	def destroy
	end
private
  	def task_params
      	params.require(:task).permit(:user_id, :body)
  	end
end
