class WhereTo < ApplicationRecord
  belongs_to :buy_item

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
