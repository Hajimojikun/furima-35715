class BuyItem < ApplicationRecord

  belongs_to :user
  belongs_to :item
  has_one :where_to
end
