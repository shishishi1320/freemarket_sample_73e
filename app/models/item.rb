class Item < ApplicationRecord
  belongs_to :brand
  belongs_to :category
  has_many :images

  enum status: { sell: 0, buy: 1 , trading:2}

  scope :on_sell, -> { where(status: 0) }
end