# README

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false,unique: true|
|e_mail|string|null: false,unique: true|
|password|string|null: false|
|first_name|string|null: false|
|name|string|null: false|
|first_name_kana|string|null: false|
|name_kana|string|null: false|
|birth|date|null: false|

### Association
- has_many :items
- has_one :credit_card
- has_one :address

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|integer(7)|null: false|
|pefecture|string|null: false|
|city|string|null: false|
|block|string|null: false|
|buildding|string||
|phone_number|integer(11)|unique|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## Itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|text|text|null: false|
|status|integer(enum)|null: false|
|size|integer(enum)|null: false|
|brand_id|references|null: false, foreign_key: true|
|condition|integer(enum)|null: false|
|shipping_cost|integer(enum)|null: false|
|delivery_method|integer(enum)|null: false|
|delivery_area|integer(enum)|null: false|
|delivery_date|integer(enum)|null: false|
|category_id|references|null: false, foreign_key: true|
|seller_id|references|null: false, foreign_key: true|
|buyer_id|references|foreign_key: true|
### Association
- has_many :images
- belongs_to :brand
- belongs_to :category
- belongs_to :seller
- belongs_to :buyer


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||
### Association
- has_many :items
- has_many :brands, through :brands_categories

## Imagesテーブル
|Column|Type|Options|
|------|----|-----|
|url|string|null: false|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item


## credit_cardテーブル
|Column|Type|Options|
|------|----|-----|
|card_id|string|null: false|
|customer_id|string|null: false|
|user_id|references|null: false, foreign_key: true|
## Association
- belongs_to :user

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :brands_categories
- has_many :categories, through : brands_categories
- has_one :item

## brands_categories
|Column|Type|Options|
|------|----|-------|
|category_id|refrences|null: false, foreign_key: true|
|barand_id|references|null: false, foreign_key: true|

### Association
- belongs_to :category
- belongs_to :brand

