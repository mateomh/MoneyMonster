class Expense < ApplicationRecord
  validates :name, :amount, presence: true
  belongs_to :author, class_name: 'User'
  has_many :groupedtransactions
  has_many :groups, through: :groupedtransactions
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
