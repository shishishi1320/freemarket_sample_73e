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
|size_id|references|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|
|condition_id|references|null: false, foreign_key: true|
|shipping_cost_id|references|null: false, foreign_key: true|
|delivery_method_id|references|null: false, foreign_key: true|
|delivery_area_id|references|null: false, foreign_key: true|
|delivery_date_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|seller_id|references|null: false, foreign_key: true|
|buyer_id|references|foreign_key: true|
### Association
- has_many :images
- belongs_to :size
- belongs_to :brand
- belongs_to :condition
- belongs_to :shipping_cost
- belongs_to :delivery_method
- belongs_to :delivery_area
- belongs_to :delivery_date
- belongs_to :category
- belongs_to :seller
- belongs_to :buyer


## delivery_areas テーブル
|Column|Type|Options|
|------|----|-------|
|area|string|null: false|
### Association
- has_one :item

## derivery_dates テーブル
|Column|Type|Options|
|------|----|-------|
|date|string|null: false|
### Association
- has_one :item

## delivery_methodsテーブル
|Column|Type|Options|
|------|----|-------|
|method_delivery|string|null: false|
### Association
- has_one :item

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|item_id|references|null: false, foreign_key: true|
|ancestry|||
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

## sizesテーブル
|Column|Type|Options|
|------|----|-----|
|size|string|null: false|
|item_id|references|null: false ,foreign_key: true|

## Association
- belongs_to :item

## Credit cardテーブル
|Column|Type|Options|
|------|----|-----|
|card_number|integer|null: false, unique: true|
|expiration_year|integer|null: false|
|expiration_month|integer|null: false|
|security_code|integer|null: false|
|user_id|references|null: false, foreign_key: true|
## Association
- belongs_to :user


## shipping_costs
|Column|Type|Options|
|------|----|-------|
|cost|string|null: false|

### Association
- has_one :item

## conditions
|Column|Type|Options|
|------|----|-------|
|item-condition|string|null: false|
|item_id|references|null: false,foreign_key: true|
### Association
- has_one :item

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :brands_categories
- has_many :categories, through : brands_categories
- has_one :item


