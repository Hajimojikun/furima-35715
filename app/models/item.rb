class Item < ApplicationRecord
  with_options presence: true do
     validates :name 
     validates :description
     validates :image
     validates :user
        with_options numericality: {other_than: 1} do
          validates :category_id
          validates :state_id
          validates :who_pay_id
          validates :prefecture_id
          validates :due_day_id
          validates :price, format:{ with: /\A[0-9]+\z/}, inclusion: {in: 300..9999999}
        end
  end
     belongs_to :user
     has_one_attached :image
   extend ActiveHash::Associations::ActiveRecordExtensions
     belongs_to :category 
     belongs_to :state 
     belongs_to :who_pay
     belongs_to :prefecture
     belongs_to :due_day
end
