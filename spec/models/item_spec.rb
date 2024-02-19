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

  it 'imageが空だと出品できない' do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
  end

    it '商品の説明が空だと出品できない' do
      @item.item_info = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item info can't be blank")
    end


    it 'カテゴリーが1だと出品できない' do
      @item.item_category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Item category must be other than 1")
    end

    it 'カテゴリーが空だと出品できない' do
      @item.item_category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item category can't be blank")
    end



    it '商品の状態が1だと出品できない' do
      @item.item_sales_status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Item sales status must be other than 1")
    end

    it '商品の状態が空だと出品できない' do
      @item.item_sales_status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item sales status can't be blank")
    end

    it '配送料の負担が1だと出品できない' do
      @item.item_shipping_fee_status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Item shipping fee status must be other than 1")
    end
    

    it '配送料の負担が空だと出品できない' do
      @item.item_shipping_fee_status_id  = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item shipping fee status can't be blank")
    end

    it '配送元の地域が1だと出品できない' do
      @item.item_prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Item prefecture must be other than 1")
    end

    it '発送元の地域が空だと出品できない' do
      @item.item_prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item prefecture can't be blank")
    end

    it '配送元の地域が1だと出品できない' do
      @item.item_scheduled_delivery_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Item scheduled delivery must be other than 1")
    end

    it '発送までの日数が空だと出品できない' do
       @item.item_scheduled_delivery_id = ''
       @item.valid?
       expect(@item.errors.full_messages).to include("Item scheduled delivery can't be blank")
    end

    it '値段が空だと出品できない' do
      @item.item_price =' ' 
      @item.valid?
      expect(@item.errors.full_messages).to include("Item price is out of setting range")
    end

    it '値段が299円以下と出品できない' do
      @item.item_price ='299' 
      @item.valid?
      expect(@item.errors.full_messages).to include("Item price is out of setting range")
    end

    it '値段が9999999円超えると出品できない' do
      @item.item_price ='9_999_999' 
      @item.valid?
      expect(@item.errors.full_messages).to include("Item price is out of setting range")
    end

    it '価格に半角数字以外が含まれている場合は出品できない' do
      @item.item_price ='１２３４５' 
      @item.valid?
      expect(@item.errors.full_messages).to include("Item price is out of setting range")
    end

    it 'ユーザー情報がない場合は登録できないこと' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
    
end

