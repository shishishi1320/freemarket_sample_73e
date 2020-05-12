FactoryBot.define do
     factory :item do 
      name {"テスト"}
      price {20000}
      text {"説明"}
      size {2}
      condition {2}
      shipping_cost {1}
      delivery_method {2}
      delivery_area {2}
      delivery_date {2}
      category_id {1}
      seller_id {1}
      buyer_id {1}
    end 
end