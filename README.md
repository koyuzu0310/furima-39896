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
| password | string | null: false |
| password-confirmation             | string | null: false |
| lase-name              | string | null: false |
| first-name              | string | null: false |
| last-name-kana              | string | null: false |
| first-name-kana              | string | null: false |
| birth-data              | string | null: false |

has_many :items
has_many :order


# itemsテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item-image               | string | null: false |
| item-name              | string | null: false, unique: true |
| item-info | string | null: false |
| item-category             | string | null: false |
| item-sales-status              | string | null: false |
| item-shipping-fee-status              | string | null: false |
| item-prefecture              | string | null: false |
| item-scheduled-delivery              | string | null: false |
| item-price              | string | null: false |
| price-content           | string | null: false |
| profit              | string | null: false |

belongs_to :user
belongs_one :order

# orderテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| number-form              | string | null: false |
| expiry-form              | string | null: false, unique: true |
| cvc-form | string | null: false |
|postal-code             | string | null: false |
| prefecture              | string | null: false |
| city             | string | null: false |
| addresses              | string | null: false |
| building              | string | null: false |
| phone-number              | string | null: false |
| button             | string | null: false |
| items              | references | not null:  外部キー |
| user              | referencer | not null: 外部キー |

belongs_to :user
belongs_to :item
has_one :order