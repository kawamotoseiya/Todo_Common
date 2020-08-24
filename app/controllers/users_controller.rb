class UsersController < ApplicationController
	before_action :authenticate_user!
	def edit
		if User.exists?(id: params[:id])
			@user = User.find(params[:id])
			if  @user != current_user
				redirect_to edit_user_path(current_user)
			end
		else
			redirect_to edit_user_path(current_user)
		end
	end
	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:user] = "ユーザーデータを更新しました！"
			redirect_to groups_path
		else
			render 'edit'
		end
	end
	private
	def user_params
		params.require(:user).permit(:name, :image, :email)
	end
end
