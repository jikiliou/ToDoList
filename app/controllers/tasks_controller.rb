class TasksController < ApplicationController

	before_action :authenticate_user!

	def new
		@list = List.find(params[:list_id])
		@task = Task.new
	end

	def create
		@list = List.find(params[:list_id])
		@task = @list.task.new(task_params)

		if @task.save
			redirect_to list_path(@list)
		else
			render 'new'
		end
	end

	def destroy
		@list = List.find(params[:list_id])
		@task = @list.task.find(params[:id])
		@task.destroy

		if @list.task.count == 0
			@list.destroy
			redirect_to lists_path, notice: "Task and List Deleted with success"
		else
			redirect_to list_path(@list), notice: "Task Deleted with success"
		end
	end


	private
		def task_params
			params.require(:task).permit(:body)
		end

end
