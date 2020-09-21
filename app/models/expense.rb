class Expense < ApplicationRecord
  belongs_to :users, foreign_key: 'author_id', class_name: 'User'
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
