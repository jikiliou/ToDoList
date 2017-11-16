class ListsController < ApplicationController

	before_action :authenticate_user!

	def index
		@lists = List.where(:user => current_user)
	end

	def new
		@list = List.new
	end

	def show
		@list = List.find(params[:id])
		list = @list
	end

	def create
		@list = List.new(list_params)
		@list.user = current_user

		if @list.save
			redirect_to @list
		else
			render 'new'
		end
	end


	private	
		def list_params
			params.require(:list).permit(:name)
		end


end
