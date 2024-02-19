require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '商品出品できる場合' do
    it '必要事項を全て入力すると商品出品できる' do
      expect(@item).to be_valid
    end
  end
  describe '商品情報入力' do
    it 'nameが空だと出品できない' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end
  end


    it '商品の説明が空だと出品できない' do
      @item.item_info = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item info can't be blank")
    end


    it 'カテゴリーが1だと出品できない' do
      @item.item_category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item category can't be blank")
    end

    it '商品の状態が1だと出品できない' do
      @item.item_sales_status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item sales status can't be blank")
    end

    it '配送料の負担が1だと出品できない' do
      @item.item_shipping_fee_status_id  = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item shipping fee status can't be blank")
    end

    it '発送元の地域が1だと出品できない' do
      @item.item_prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item prefecture can't be blank")
    end

    it '発送までの日数が1だと出品できない' do
       @item.item_scheduled_delivery_id = ''
       @item.valid?
       expect(@item.errors.full_messages).to include("Item scheduled delivery can't be blank")
    end

    it '値段が299円以下9999999以上だと出品できない' do
      @item.item_price =' ' 
      @item.valid?
      expect(@item.errors.full_messages).to include("Item price is out of setting range")
    end
end
