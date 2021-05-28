class Item < ApplicationRecord
  with_options presence: true do
     :name 
     :description
     :price
     :image
     :user
        with_options numericality: {other_than: 1} do
          :category_id
          :state
          :who_pay_id
          :prefecture_id
          :due_day_id
        end
  end
     belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtentions
     belongs_to :category 
     belongs_to :state 
     belongs_to :who_pay
     belongs_to :prefecture
     belongs_to :due_day
end
