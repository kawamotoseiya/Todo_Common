class GroupUsersController < ApplicationController
	def index
		@group = Group.find(params[:group_id])
		@group_users = GroupUser.where(group_id: @group.id)

	end
	def create
		group = Group.find(params[:group_id])
		group_user = GroupUser.new
		group_user.user_id = current_user.id
		group_user.group_id = group.id
		group_user.permit_status = '拒否'
		group_user.join_status = '参加申請中'
		group_user.save!
		redirect_back(fallback_location: root_path)
	end
	def update
		group = Group.find(params[:group_id])
		group_user = GroupUser.find(params[:id])
		group_user.update(permit_status: '許可', join_status: '参加中')
		redirect_to group_group_users_path(group.id)
	end
	def destroy
		group_user = GroupUser.find(params[:id])
		group_user.destroy
		redirect_to groups_path
	end
end
