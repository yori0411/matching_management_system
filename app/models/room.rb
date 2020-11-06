class Room < ApplicationRecord
    belongs_to :user, primary_key: 'user_id', foreign_key: 'user_id'
    belongs_to :user, primary_key: 'user_id', foreign_key: 'partner_id'
    has_many :texts
end
