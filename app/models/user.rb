class User < ApplicationRecord
    has_many :texts, primary_key: 'user_id', foreign_key: 'user_id'
end
