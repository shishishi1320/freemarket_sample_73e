class Item < ApplicationRecord
  belongs_to :brand
  belongs_to :category, optional: true
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :brand

  # enum status: { sell: 0, buy: 1 , trading:2}

  enum status: { sell: 0, buy: 1 , trading:2}
  scope :on_sell, -> { where(status: 0) }

  enum shipping_cost: { 送料込み（出品者負担）:0,着払い（購入者負担）:1 }
  enum delivery_area: {
    北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47
  }
  enum delivery_date:{ "1~2日で発送": 0, "2~3日で発送": 1, "4~7日で発送": 2 }
  enum size:{ "FREE SIZE": 0, "XXS以下": 1, "XS(SS)": 2, "S": 3, "M": 4, "L": 5, "XL(LL)": 6, "2XL(3L)": 7, "3XL(4L)": 8, "4XL(5L)以上": 9 }
  enum condition:{ 新品、未使用: 0, 未使用に近い: 1, 目立った傷や汚れなし: 2, やや傷や汚れあり: 3, 傷や汚れあり: 4, 全体的に状態が悪い: 5 }
  enum delivery_method: { "未定": 0, "らくらくメルカリ便": 1, "ゆうメール": 2, "レターパック": 3, "普通郵便（定型、定型外）": 4, "クロネコヤマト": 5, "ゆうパック": 6, "クリックポスト": 7, "ゆうパケット": 8 }

  validate :img_erorr
  validates :name, :text, :category_id, :size, :condition, :shipping_cost, :delivery_method, :delivery_area, :delivery_date,  :price, :seller_id, presence: true
  validates :text, length: { maximum: 1000 }
  validates :price, numericality: { greater_than: 299, less_than: 9999999 }   

  def img_erorr
    if images.present?
    else
      errors.add(:url, "は1枚以上登録してください")
    end
  end
end