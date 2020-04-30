class Item < ApplicationRecord
  belongs_to :brand
  # belongs_to :category_id
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :brand

  enum shipping_cost: { default: 0, seller: 1, buyer: 2 }
  enum delivery_area: {
    北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47
  }, _prefix: true
  enum delivery_date:{ default: 0, short: 1, middle: 2, long: 3 }, _prefix: true
  enum size:{ default: 0, f: 1, xxs: 2, ss: 3, s: 4, m: 5, l: 6, ll: 7, lll: 8, llll: 9, lllll: 10 }, _prefix: true
  enum condition:{ default: 0, new: 1, nearlynew: 2, pristine: 3, somestains: 4, stains: 5, old: 6 }, _prefix: true

end