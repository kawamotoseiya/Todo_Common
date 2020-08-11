class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.integer :user_id
      t.string :name
      t.boolean :group_key_flag, default: false

      t.timestamps
    end
  end
end
