class CreditCard < ApplicationRecord
  belongs_to :user, optional: true
  validates :card_id, :customer_id, :user_id, presence: true
end
