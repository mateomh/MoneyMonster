class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :groups, through: :groupedtransactions
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
