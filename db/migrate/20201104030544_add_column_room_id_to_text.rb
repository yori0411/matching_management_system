class AddColumnRoomIdToText < ActiveRecord::Migration[5.1]
  def change
    add_column :texts, :room_id, :integer

  end
end
