class CreateGroupUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :group_users do |t|
      t.integer :user_id
      t.integer :group_id
      t.boolean :permit_status, default: false
      t.integer :join_status, defaulu: 0

      t.timestamps
    end
  end
end
