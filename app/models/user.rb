class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーションの記載
  # has_many :items
  # has_many :orders

  # バリデーションの一括設定
  # with_options presence: true do
  #   validates :nickname
  #   validates :birthday
  #   validates :family_name
  #   validates :first_name 
  #   validates :family_kana 
  #   validates :first_kana 
  # end


end
