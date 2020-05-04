class User < ApplicationRecord
  has_one :credit_card, dependent: :destroy
end
