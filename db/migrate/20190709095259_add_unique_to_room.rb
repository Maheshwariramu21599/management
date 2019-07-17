class AddUniqueToRoom < ActiveRecord::Migration[5.2]
  def change
    add_index :rooms, :room_no, unique: true
  end
end
