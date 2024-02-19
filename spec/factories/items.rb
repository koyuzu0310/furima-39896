FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    item_name                  { "商品名" }
    item_info                  { "説明" }
    item_category_id           { 2 }
    item_sales_status_id       { 2 }
    item_shipping_fee_status_id { 2 }
    item_prefecture_id         { 2 }
    item_scheduled_delivery_id     { 2 }
    item_price                 { 2000 }
    association :user
  end
end
