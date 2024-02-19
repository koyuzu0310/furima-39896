class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_sales_status
  belongs_to :item_shipping_fee_status
  belongs_to :item_prefecture
  belongs_to :item_scheduled_delivery
  

#テストコードバリデーション
  validates :image, presence: true
  validates :item_name,presence: true
  validates :item_info, presence: true
  validates :item_category_id, presence: true, numericality: { other_than: 1 }
  validates :item_sales_status_id, presence: true, numericality: { other_than: 1 }
  validates :item_shipping_fee_status_id, presence: true, numericality: { other_than: 1 }
  validates :item_prefecture_id, presence: true, numericality: { other_than: 1 }
  validates :item_scheduled_delivery_id, presence: true, numericality: { other_than: 1 }
  validates :item_price, presence: true,
                       numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }

 # validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end
