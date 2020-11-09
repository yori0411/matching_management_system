class User < ApplicationRecord
    has_many :rooms, primary_key: 'user_id', foreign_key: 'user_id'
end
