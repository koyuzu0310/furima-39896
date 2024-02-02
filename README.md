# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# usersテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname               | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name              | text | null: false |
| first_name              | text | null: false |
| last_name_kana              | text | null: false |
| first_name_kana              | text | null: false |
| birth_data              | date | null: false |

has_many :items
has_many :orders


# itemsテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item_name              | string | null: false, unique: true |
| item_info | text | null: false |
| item_category             | integer | null: false |
| item_sales-status              |integer | null: false |
| item_shipping-fee-status              | integer | null: false |
| item_prefecture              | integer | null: false |
| item_scheduled-delivery              | integer | null: false |
| item_price              | integer | null: false |


belongs_to :user
has_one :order

# ordersテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item            | references | not null:  foreign_key: true |
| user              | references | not null:foreign_key: true |

belongs_to :user
belongs_to :item
has_one :address

# addressesテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
|postal_code             | string | null: false |
| item_prefecture              | integer | null: false |
| city             | string | null: false |
| addresses              | string | null: false |
| building              | string |         |
| phone_number              | string | null: false |
| order              | references | not null:foreign_key: true |

belongs_to :order