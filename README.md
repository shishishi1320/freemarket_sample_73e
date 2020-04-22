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
|postal_code|integer(7)|null: false|
|pefecture|string|null: false|
|city|string|null: false|
|block|string|null: false|
|buildding|string||
|phone_number|integer(11)|unique|

### Association
- has_many :items
- has_one :credit_cards



## Itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|text|text|null: false|
|status|integer(enum)|null: false|
|image_id|references|null: false, foreign_key: true|
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
- has_one :sizes
- has_one :brands
- has_one :conditions
- has_one :shipping_costs
- has_one :delivery_methods
- has_one :delivery_areas
- has_one :delivery_dates
- has_many :categories
- has_one :seller
- has_one :buyer


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
- belongs_to :item
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
- has_one :item

## Credit cardテーブル
|Column|Type|Options|
|------|----|-----|
|card_number|integer|null: false, unique: true|
|expiration_year|integer|null: false|
|expiration_month|integer|null: false|
|security_code|integer|null: false|
|user_id|references|null: false, foreign_key: true|
## Association
- has_one :user


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
|brand-name|string|null: false|
### Association
- has_many :brands_categories
- has_many :categories, through : brands_categories
- has_one :item

