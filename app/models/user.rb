class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
          
         validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "が正しくありません"}

         with_options presence: true do
            validates :nickname
            validates :birth_day
              with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "を正しく入力してください"} do
                validates :first_name
                validates :last_name
                  with_options format:{with: /\A[ァ-ヶー－]+\z/, message: "を正しく入力してください"} do
                    validates :first_name_kana
                    validates :last_name_kana
                  end
              end
         end

         has_many :items
         has_many :buy_items
end
