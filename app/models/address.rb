class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :send_first_name, :send_name,  :send_first_name_kana,  :send_name_kana, :postal_code,  :prefecture, :city,  :block, presence: true

end
