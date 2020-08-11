class AddjoinStatusTogroupUsers < ActiveRecord::Migration[5.2]
	def up
  	    change_column :group_users, :join_status, :integer, default: 0
  	end
  	def down
  		change_column :group_users, :join_status, :integer
  	end
end
