class BrandsCategory < ApplicationRecord
  belongs_to :category_id
  belongs_to :brand_id
end
