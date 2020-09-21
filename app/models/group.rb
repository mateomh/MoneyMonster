class Group < ApplicationRecord
  has_many :groupedtransactions
  has_many :expenses, through: :groupedtransactions
  belongs_to :creator, class_name: 'User'
end
