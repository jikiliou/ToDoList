require 'rails_helper'

RSpec.describe TasksController, type: :controller do

	before do
		@user1 = User.create!(:email => "love@love.fr", :password => "loveislove")
		@list1 = List.create!(:user => @user1, :name => "Basic")
		sign_in @user1
	end

	describe "GET new" do
		it "Simple get render new" do
			get :new, params: {:list_id => @list1.id}
			expect(response).to render_template("new")
		end
	end

	describe "POST create" do

		it "Fail create => render new" do
			post :create, params: {:list_id => @list1.id, :task => {:body => ""}}
			expect(response).to render_template("new")
		end

		it "Create and redirect to list show" do
			post :create, params: {:list_id => @list1.id, :task => {:body => "Love yall"}}
			expect(response).to redirect_to("/lists/1")
		end
	end

	describe "DELETE destroy" do
		it "Destroy the task and redirect to show list" do
			task1 = @list1.task.create!(:body => "Kiss")
			task2 = @list1.task.create!(:body => "XOXO")

			delete :destroy, params: {:list_id => @list1.id, :id => task1.id}
			expect(response).to redirect_to("/lists/1")
		end

		it "Destroy the task, the list and redirect to list index" do
			task = @list1.task.create!(:body => "Kiss")

			delete :destroy, params: {:list_id => @list1.id, :id => task.id}
			expect(response).to redirect_to("/lists")
		end
	end

end
