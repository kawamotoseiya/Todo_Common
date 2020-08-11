class CommentsController < ApplicationController
	def create
		 group = Group.find(params[:group_id])
		 todolist = Todolist.find(params[:todolist_id])
		 @comment = Comment.new(comment_params)
		 @comment.user_id = current_user.id
		 @comment.todolist_id = todolist.id
		 @comment.save
		 redirect_to group_todolist_path(group, todolist)
	end
	def destroy
		group = Group.find(params[:group_id])
		todolist = Todolist.find(params[:todolist_id])
		@comment = Comment.find_by(id: params[:id], todolist_id: params[:todolist_id])
		@comment.destroy
		redirect_to group_todolist_path(group, todolist)
	end
	private
	def comment_params
		params.require(:comment).permit(:comment)
	end
end
