class Groupedtransaction < ApplicationRecord
  belongs_to :group
  belong_to :expense
end
