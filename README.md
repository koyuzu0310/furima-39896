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
| encrypted_password             | string | null: false |
| lase_name              | name | null: false |
| first_name              | name | null: false |
| last_name_kana              | name | null: false |
| first_name_kana              | name | null: false |
| birth_data              | date | null: false |

has_many :items
has_many :order


# itemsテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item_name              | string | null: false, unique: true |
| item_info | string | null: false |
| item_category             | text | null: false |
| item_sales-status              | string | null: false |
| item_shipping-fee-status              | string | null: false |
| item_prefecture              | string | null: false |
| item_scheduled-delivery              | string | null: false |
| item_price              | integer | null: false |


belongs_to :user
belongs_one :order

# orderテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| items              | references | not null:  外部キー |
| user              | references | not null: 外部キー |

belongs_to :user
belongs_to :item
has_one :address

# addressテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| number-form              | string | null: false |
| expiry-form              | string | null: false, unique: true |
| cvc_form | string | null: false |
|postal_code             | string | null: false |
| prefecture              | string | null: false |
| city             | string | null: false |
| addresses              | string | null: false |
| building              | string | null: false |
| phone_number              | string | null: false |
| button             | string | null: false |

belongs_to : order