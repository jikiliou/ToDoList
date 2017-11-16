require 'rails_helper'

RSpec.describe List, type: :model do

	before do
		@user1 = User.create!(:email => "love@love.fr", :password => "loveislove")
	end

	context "When there's something wrong with the user" do
		it "No user => raise an Error" do
			expect{
				list = List.create!
			}.to raise_error(ActiveRecord::RecordInvalid)
		end

	context "When there's something wrong with the name"
		it "No Name => raise an Error " do
			expect {
				list = List.create!(:user => @user1)
			}.to raise_error(ActiveRecord::RecordInvalid)
		end

		it "Empty string => raise an Error " do
			expect {
				list = List.create!(:user => @user1, :name => "")
			}.to raise_error(ActiveRecord::RecordInvalid)
		end

		it "Name too long => raise an Error" do
			expect {
				list = List.create!(:user => @user1, :name => "A" * 101)
			}.to raise_error(ActiveRecord::RecordInvalid)
		end
	end

	context "When everything's fine" do
		it "User and name => created" do
			list = List.create!(:user => @user1, :name => "Waow")

			expect(list.name).to eql("Waow")
		end
	end
end
