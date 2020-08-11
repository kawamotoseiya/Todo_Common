class GroupUser < ApplicationRecord
	belongs_to :user
	belongs_to :group
	enum join_status: { 参加する: 0, 参加申請中: 1, 参加中: 2}
	enum permit_status: { 許可: true, 拒否: false}
end