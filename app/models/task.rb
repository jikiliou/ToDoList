class Task < ApplicationRecord
  belongs_to :list

  validates :body, presence:true, length: {minimum: 1, maximum: 100}
end
