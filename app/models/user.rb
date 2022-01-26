class User < ApplicationRecord
    has_many :rooms, primary_key: 'user_id1', foreign_key: 'user_id'
    has_many :rooms, primary_key: 'user_id2', foreign_key: 'user_id'

  validates :name, presence: true
  validates :gender, presence: true
  #validates :filename, presence: true
  validates :q1, presence: true
  validates :q2, presence: true
  validates :q3, presence: true
  validates :q4, presence: true
  validates :q5, presence: true
  validates :q6, presence: true
  validates :q7, presence: true
  validates :q8, presence: true
  validates :q9, presence: true
  validates :q10, presence: true
  validates :q11, presence: true
  validates :q12, presence: true

end