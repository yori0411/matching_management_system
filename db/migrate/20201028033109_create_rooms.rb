class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :user_id1
      t.string :user_id2
      t.integer :room_id

      t.timestamps
    end
  end
end
