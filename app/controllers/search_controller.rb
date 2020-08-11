class SearchController < ApplicationController
	def search
		content = params["search"]["content"]
		@group = Group.find_by(id: content)
		@group_user = GroupUser.find_by(group_id: @group.id, user_id: current_user.id)
	end
end
