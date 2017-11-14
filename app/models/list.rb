class List < ApplicationRecord
	has_many :task
	belongs_to :user
	
	validates :name, length: {maximum: 255}
end
