class ChecksController < ApplicationController #協力ボタン
	before_action :authenticate_user!
	def create
		@group = Group.find(params[:group_id])
		@todolist = Todolist.find(params[:todolist_id])
		check = current_user.checks.new(todolist_id: @todolist.id)
		check.save
	end
	def destroy
		@group = Group.find(params[:group_id])
		@todolist = Todolist.find(params[:todolist_id])
		check = current_user.checks.find_by(todolist_id: @todolist.id)
		check.destroy
	end
end
