require 'rails_helper'

RSpec.describe "lists/show.html.erb", type: :view do
	before do
		@user1 = User.create!(:email => "love@love.fr", :password => "loveislove")
		@list1 = List.create!(:user => @user1, :name => "Basic")
	end

	context "Showing good info" do
		it "Show one list" do
			assign(:list, @list1)
			render

			expect(rendered).to have_selector(".card .card-header a", text: "Basic")
		end
	end

end
