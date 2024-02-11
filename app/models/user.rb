class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true, length: { minimum: 6 }
         validates :password, presence: true, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/}
         validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥ヴァーヶ々]+\z/}
         validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥ヴァーヶ々]+\z/}
         validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
         validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
         validates :birth_data, presence: true
end
