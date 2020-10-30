class Text < ApplicationRecord
    belongs_to :user, primary_key: 'user_id', foreign_key: 'user_id'
    belongs_to :user, primary_key: 'user_id', foreign_key: 'partner_id'
end
