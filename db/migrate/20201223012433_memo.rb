class Memo < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :memo, :string
  end
end
