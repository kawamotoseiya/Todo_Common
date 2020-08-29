class TodolistsController < ApplicationController
	before_action :authenticate_user!
	before_action :group_exists, only: [:new, :index, :show, :edit]  #存在しないグループのときに拒否する
	def new
		@todolist = Todolist.new
		@group = Group.find(params[:group_id])
		group_user = GroupUser.find_by(group_id: @group.id, user_id: current_user.id)
		if group_user.nil?
			redirect_to groups_path
		else
			if  group_user.permit_status != "許可"
				redirect_to groups_path
			end
		end
	end
	def create
		@group = Group.find(params[:group_id])
		@todolist = Todolist.new(todolist_params)
		@todolist.group_id = @group.id
		if @todolist.save
			flash[:todolist] = "TODOリストを作成しました！"
		redirect_to group_todolists_path(@group)
		else
			render 'new'
		end
	end
	def index
		@today = Date.current
		@group = Group.find(params[:group_id])
		@todolists = Todolist.where(group_id: @group).page(params[:page]).reverse_order
		group_user = GroupUser.find_by(group_id: @group.id, user_id: current_user.id)
		if group_user.nil?
			redirect_to groups_path
		else
			if group_user.permit_status != "許可"
				redirect_to groups_path
			end
		end
	end
	def show
		@group = Group.find(params[:group_id])
		group_user = GroupUser.find_by(group_id: @group.id, user_id: current_user.id)
		@todolist = Todolist.find_by(group_id: @group.id, id: params[:id])
		unless @todolist.nil?
			@comments = Comment.where(todolist_id: @todolist.id).reverse
			@comment = Comment.new
			if  group_user.permit_status != "許可"
				redirect_to groups_path
			end
		else
			redirect_to groups_path
		end
	end
	def edit
		@group = Group.find(params[:group_id])
		group_user = GroupUser.find_by(group_id: @group.id, user_id: current_user.id)
		@todolist = Todolist.find_by(group_id: @group.id, id: params[:id])
		if @todolist.nil?
			redirect_to groups_path
		else
			if  group_user.permit_status != "許可"
				redirect_to groups_path
			end
		end
	end
	def update
		@todolist = Todolist.find(params[:id])
		group_id = @todolist.group_id
		if @todolist.update(todolist_params)
			flash[:todolist] = "TODOリストを更新しました！"
		   redirect_to group_todolists_path(group_id)
		else
			@group = Group.find(params[:group_id])
			render 'edit'
		end
	end
	def destroy
		@todolist = Todolist.find(params[:id])
		group_id = @todolist.group_id
		@todolist.destroy
		redirect_to group_todolists_path(group_id)
	end
	private
	def todolist_params
	params.require(:todolist).permit(:group_id, :head, :body, :day)
	end
	def group_exists
		unless Group.exists?(id: params[:group_id])
			redirect_to groups_path
		end
	end
end
