require 'rails_helper'

RSpec.describe Task, type: :model do
	before do
		@user1 = User.create!(:email => "love@love.fr", :password => "loveislove")
		@list = List.create!(:user => @user1, :name => "Basic")
	end

	context "When something's wrong with the body" do
		it "No body => raise error" do
			expect {
				task = @list.task.create!()
			}.to raise_error(ActiveRecord::RecordInvalid)
		end

		it "Empty string => raise an Error " do
			expect {
				task = @list.task.create!(:body => "")
			}.to raise_error(ActiveRecord::RecordInvalid)
		end

		it "Body more than 100 char => raise error" do
			expect {
				task = @list.task.create!(:body => "A" * 101)
			}.to raise_error(ActiveRecord::RecordInvalid)
		end
	end

	context "When everything's fine" do
		it "Body and list => Created" do
			task = @list.task.create!(:body => "Wash dishes")

			expect(task.body).to eql("Wash dishes")
		end
	end
end
