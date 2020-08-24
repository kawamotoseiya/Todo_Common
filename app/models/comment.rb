class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :todolist
	validates :comment, presence: true, length: {maximum: 100, minimum: 1}
end
