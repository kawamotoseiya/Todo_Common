class ChecksController < ApplicationController
	def create
		group = Group.find(params[:group_id])
		todolist = Todolist.find(params[:todolist_id])
		check = current_user.checks.new(todolist_id: todolist.id)
		check.save
		redirect_to group_todolists_path(group)
	end
	def destroy
		group = Group.find(params[:group_id])
		todolist = Todolist.find(params[:todolist_id])
		check = current_user.checks.find_by(todolist_id: todolist.id)
		check.destroy
		redirect_to group_todolists_path(group)
	end
end
