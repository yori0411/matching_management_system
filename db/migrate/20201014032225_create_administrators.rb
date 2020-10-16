class CreateAdministrators < ActiveRecord::Migration[5.1]
  def change
    create_table :administrators do |t|
      t.string :user_id
      t.string :password_digest

      t.timestamps
    end
  end
end
