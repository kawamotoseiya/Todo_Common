class AddDayToTodolists < ActiveRecord::Migration[5.2]
  def change
    add_column :todolists, :day, :date
  end
end
