class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
            validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
            validates :nickname
            validates :birth_day
              with_options format: { with: /\A[ぁ-んァ-ン一-龥]/} do
                validates :first_name
                validates :last_name
                  with_options format:{with: /\A[ァ-ヶー－]+\z/} do
                    validates :first_name_kana
                    validates :last_name_kana
                  end
              end
         end
end
