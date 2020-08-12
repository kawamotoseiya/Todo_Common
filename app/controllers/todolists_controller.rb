class TodolistsController < ApplicationController
	def new
		@todolist = Todolist.new
		@group = Group.find(params[:group_id])
	end
	def create
		@group = Group.find(params[:group_id])
		@todolist = Todolist.new(todolist_params)
		@todolist.group_id = @group.id
		@todolist.save
		redirect_to group_todolists_path(@group)
	end
	def index
		@group = Group.find(params[:group_id])
		@todolists = Todolist.where(group_id: @group)

	end
	def show
		@group = Group.find(params[:group_id])
		@todolist = Todolist.find(params[:id])
		@comments = Comment.where(todolist_id: @todolist.id)
		@comment = Comment.new
	end
	def edit
		@todolist = Todolist.find(params[:id])
		@group = Group.find(params[:group_id])
	end
	def update
		@todolist = Todolist.find(params[:id])
		group_id = @todolist.group_id
		@todolist.update(todolist_params)
		redirect_to group_todolists_path(group_id)
	end
	def destroy
		@todolist = Todolist.find(params[:id])
		group_id = @todolist.group_id
		@todolist.destroy
		redirect_to group_todolists_path(group_id)
	end
	private
	def todolist_params
	params.require(:todolist).permit(:group_id, :head, :body)
	end
end
