class Task < ApplicationRecord
  belongs_to :list

  validates :body, presence:true, length: {maximum: 255}
end
