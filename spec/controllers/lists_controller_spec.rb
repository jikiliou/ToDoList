require 'rails_helper'

RSpec.describe ListsController, type: :controller do

	before do
		@user1 = User.create!(:email => "love@love.fr", :password => "loveislove")
		@list1 = List.create!(:user => @user1, :name => "Basic")
		sign_in @user1
	end

	describe "GET index" do
		it "Simple get render index" do
			get :index
			expect(response).to render_template("index")
		end
	end

	describe "GET new" do
		it "Simple get render new" do
			get :new
			expect(response).to render_template("new")
		end
	end

	describe "GET show" do
		it "Simple get render show" do
			get :show, params: {id: @list1.id}
			expect(response).to render_template("show")
		end
	end

	describe "POST create" do

		it "Fail create => render new" do
			post :create, params: {:list => {:name => ""}}
			expect(response).to render_template("new")
		end

		it "Successful create => render show the new list" do
			post :create, params: {:list => {:name => "Lol", :user => @user1}}
			expect(response).to redirect_to("/lists/2")
		end

	end

end
