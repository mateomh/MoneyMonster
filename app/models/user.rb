class User < ApplicationRecord
  validates :name, uniqueness: true
  validates :name, presence: true

  has_many :expenses, foreign_key: 'author_id', class_name: 'Expense' 
end
