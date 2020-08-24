class CommentsController < ApplicationController
	before_action :authenticate_user!
	def create
		 @group = Group.find(params[:group_id])
		 @todolist = Todolist.find(params[:todolist_id])
		 @comment = Comment.new(comment_params)
		 @comment.user_id = current_user.id
		 @comment.todolist_id = @todolist.id
		if @comment.save
		 render :comment
		else
			@comments = Comment.where(todolist_id: @todolist.id)
			render '/todolists/show'
		end
	end
	def destroy
		@group = Group.find(params[:group_id])
		@todolist = Todolist.find(params[:todolist_id])
		@comment = Comment.find_by(id: params[:id], todolist_id: params[:todolist_id])
		@comment.destroy
		render :comment
	end
	private
	def comment_params
		params.require(:comment).permit(:comment)
	end
end
