class User < ApplicationRecord
    has_many :rooms, primary_key: 'user_id1', foreign_key: 'user_id'
    has_many :rooms, primary_key: 'user_id2', foreign_key: 'user_id'
end
