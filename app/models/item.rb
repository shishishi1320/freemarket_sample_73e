class Item < ApplicationRecord
  # belongs_to :brand_id
  # belongs_to :category_id
  # belongs_to :category_id
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
end
