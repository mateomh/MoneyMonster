class User < ApplicationRecord
  validates :name, uniqueness: true
  validates :name, presence: true

  has_many :expenses, foreign_key: 'author_id', class_name: 'Expense'
  has_many :groups, foreign_key: 'creator_id', class_name: 'Group'
end
