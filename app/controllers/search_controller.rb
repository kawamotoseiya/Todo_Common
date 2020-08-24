class SearchController < ApplicationController
	before_action :authenticate_user!
	def search_form
	end

	def search
		content = params["search"]["content"]
		if Group.exists?(id: content)
		@group = Group.find_by(id: content)
		@group_user = GroupUser.find_by(group_id: @group.id, user_id: current_user.id)
		else
			redirect_to search_not_search_path
		end
	end

	def not_search
		
	end
	def search_date
		date = params["search"]["date"]
		@today = Date.current
		if Group.exists?(id: params[:group_id])
			@group = Group.find(params[:group_id])
			@todolists = Todolist.where(group_id: @group.id, day: date).page(params[:page]).reverse_order
			group_user = GroupUser.find_by(group_id: @group.id, user_id: current_user.id)
			if group_user.nil?
				redirect_to groups_path
			else
				if group_user.permit_status != "許可"
					redirect_to groups_path
				end
			end
		else
			redirect_to groups_path
		end
	end
end
