class SearchController < ApplicationController
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
end
