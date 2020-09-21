class Group < ApplicationRecord
  has_many :groupedtransactions
  has_many :expenses, through: :groupedtransactions
  belongs_to :creator, class_name: 'User'
  scope :ordered_by_name, -> { order(:name) }
end
