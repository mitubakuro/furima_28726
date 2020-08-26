class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーションの記載
  has_many :items
  # has_many :orders

  # バリデーションの一括設定
  hira_kata_kan = /[ぁ-んァ-ン一-龥]/
  katakana = /[ァ-ヶー－]+/
  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :family_name, format: { with: hira_kata_kan }
    validates :first_name, format: { with: hira_kata_kan }
    validates :family_kana, format: { with: katakana }
    validates :first_kana, format: { with: katakana }
    # パスワードは半角英数字が混合
  end
  validates :password, format: { with: /(?=.*[0-9])(?=.*[a-zA-Z])[0-9a-zA-Z]/ }
end
