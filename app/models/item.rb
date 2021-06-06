class Item < ApplicationRecord
  validates :image, presence:{message: "のファイルを添付して下さい"}
  with_options presence: true do
     validates :name 
     validates :description
     validates :user
     validates :price, format:{ with: /\A[0-9]+\z/, message: "を正しく入力してください"}, inclusion: {in: 300..9999999, message: "を範囲内にお願いします"}
        with_options numericality: {other_than: 1, message: "を選んでください"} do
          validates :category_id
          validates :state_id
          validates :who_pay_id
          validates :prefecture_id
          validates :due_day_id
        end
  end
     belongs_to :user
     has_one    :buy_item
     has_one_attached :image
   extend ActiveHash::Associations::ActiveRecordExtensions
     belongs_to :category 
     belongs_to :state 
     belongs_to :who_pay
     belongs_to :prefecture
     belongs_to :due_day
end