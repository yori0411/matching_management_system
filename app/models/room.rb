class Room < ApplicationRecord
    belongs_to :user, primary_key: 'user_id', foreign_key: 'user_id1'
    belongs_to :user, primary_key: 'user_id', foreign_key: 'user_id2'
    has_many :texts
end
