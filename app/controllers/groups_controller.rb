class GroupsController < ApplicationController
	before_action :authenticate_user!
	def new
		@group = Group.new
	end
	def create
		@group = Group.new(group_params)
		@group.user_id = current_user.id
		if @group.save
		flash[:group_create] = "新たなグループを作成しました！"
		@group_user = GroupUser.new
		@group_user.user_id = current_user.id
		@group_user.group_id = @group.id
		@group_user.permit_status = '許可'
		@group_user.join_status = '参加中'
		@group_user.save!
		redirect_to groups_path
		else
		@group_users = GroupUser.where(user_id: current_user.id, join_status: '参加中' ).page(params[:page]).per(12)
		render 'index'
		end
	end
	def index
		@group = Group.new
		@group_users = GroupUser.where(user_id: current_user.id, join_status: '参加中' ).page(params[:page]).per(12)
	end
	def edit
			@group = Group.find(params[:id])
			group_user = GroupUser.find_by(group_id: @group.id, user_id: current_user.id)
	end
	def update
		@group = Group.find(params[:id])
		if @group.update(group_params)
		flash[:group_update] = "グループを更新しました！"
		redirect_to group_todolists_path(@group)
		else
			render 'edit'
		end

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
	def group_exists
		unless Group.exists?(id: params[:group_id])
			redirect_to groups_path
		end
	end
end
