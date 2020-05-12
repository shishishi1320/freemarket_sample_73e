class User < ApplicationRecord
  has_one :credit_card, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :address
  has_one :credit_card, dependent: :destroy
  validates :nickname,  uniqueness: true
  validates :nickname, :first_name,  :name, :first_name_kana, :name_kana, :birth,    presence: true
  validates :first_name_kana, :name_kana, format: { with: /[^ -~｡-ﾟ]+/, message: "全角で入力して下さい"}
  validates :first_name,  :name, format: { with:  /[^ -~｡-ﾟ]+/, message: "全角で入力して下さい"}
end
