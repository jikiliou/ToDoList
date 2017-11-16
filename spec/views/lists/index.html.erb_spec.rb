require 'rails_helper'

RSpec.describe "lists/index.html.erb", type: :view do
	before do
		@user1 = User.create!(:email => "love@love.fr", :password => "loveislove")
		@list1 = List.create!(:user => @user1, :name => "Basic")
		@list2 = List.create!(:user => @user1, :name => "Simple")
		@lists = List.all
	end

	context "Show the right info" do
		it "Show 2 lists" do
			assign(:lists, @lists)

			render

			expect(rendered).to have_selector(".card", :count => 2)
		end
	end

end
