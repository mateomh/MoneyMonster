class Group < ApplicationRecord
  has_many :expenses, through: :groupedtransactions
end
