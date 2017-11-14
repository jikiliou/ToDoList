class TasksController < ApplicationController

	before_action :authenticate_user!

	def new
		@list = List.find(params[:list_id])
	end

	def create
		@list = List.find(params[:list_id])
		@task = @list.task.create(task_params)

		redirect_to list_path(@list)
	end

	def destroy
		@list = List.find(params[:list_id])
		@task = @list.task.find(params[:id])
		@task.destroy

		redirect_to list_path(@list)
	end


	private
		def task_params
			params.require(:task).permit(:body)
		end

end
