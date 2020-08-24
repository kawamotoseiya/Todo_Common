class Todolist < ApplicationRecord
	
	belongs_to :group

	has_many :comments, dependent: :destroy
	has_many :checks, dependent: :destroy

	validates :head, presence: true

	def checked_by?(user)
    checks.where(user_id: user.id).exists?
  	end
end
