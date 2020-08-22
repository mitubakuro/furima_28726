class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーションの記載
  # has_many :items
  # has_many :orders

  # バリデーションの一括設定
  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :family_name, format: { with: /[ぁ-んァ-ン一-龥]/ }
    validates :first_name, format: { with: /[ぁ-んァ-ン一-龥]/ }
    validates :family_kana, format: { with: /[ァ-ヶー－]+/ }
    validates :first_kana, format: { with: /[ァ-ヶー－]+/ }
    # パスワードは半角英数字が混合
    validates :password, format: { with: /(?=.*[0-9])(?=.*[a-zA-Z])[0-9a-zA-Z]/ }
  end
end
