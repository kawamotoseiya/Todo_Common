class CreateTodolists < ActiveRecord::Migration[5.2]
  def change
    create_table :todolists do |t|
      t.integer :group_id
      t.string :head
      t.text :body

      t.timestamps
    end
  end
end
