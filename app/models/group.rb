class Group < ApplicationRecord
	
	belongs_to :user
	has_many :group_users, dependent: :destroy
	has_many :todolists, dependent: :destroy

	enum group_key_flag: { 有効: true, 無効: false}

	validates :name, presence: true
end
