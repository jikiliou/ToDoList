class List < ApplicationRecord
	has_many :task
	belongs_to :user
	
	validates :name, presence:true, length: {minimum: 1, maximum: 100}
end
