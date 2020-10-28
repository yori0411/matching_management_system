class AddColumnText < ActiveRecord::Migration[5.1]
  def change

    add_column :texts, :user_id, :string
    add_column :texts, :partner_id, :string

  end
end
