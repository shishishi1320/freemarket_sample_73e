class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :send_first_name, :send_name,  :send_first_name_kana,  :send_name_kana, :postal_code,  :prefecture, :city,  :block, presence: true
  validates :postal_code,format: {with:/\A\d{7}\z/,message:"数字7桁ハイフンなしで入力して下さい"}
end
