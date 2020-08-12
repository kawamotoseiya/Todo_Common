class GroupsController < ApplicationController
	def new
		@group = Group.new
	end
	def create
		@group = Group.new(group_params)
		@group.user_id = current_user.id
		@group.save
		@group_user = GroupUser.new
		@group_user.user_id = current_user.id
		@group_user.group_id = @group.id
		@group_user.permit_status = '許可'
		@group_user.join_status = '参加中'
		@group_user.save!
		redirect_to groups_path
	end
	def index
		@group = Group.new
		@group_users = GroupUser.where(user_id: current_user.id, join_status: '参加中')
	end
	def edit
		@group = Group.find(params[:id])
	end
	def update
		@group = Group.find(params[:id])
		@group.update(group_params)
		redirect_to group_todolists_path(@group)
	end
	def destroy
		@group = Group.find(params[:id])
		@group.destroy
		redirect_to groups_path
	end
	private
	def group_params
		params.require(:group).permit(:user_id, :name, :group_key_flag)
	end
end
