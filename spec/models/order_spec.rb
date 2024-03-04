require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user_id: @user.id)
    @order_form = FactoryBot.build(:order_form, item_id: @item.id, user_id: @user.id)
  end

  context '購入できる場合' do
    it '必要事項を全て入力すると購入できる' do
      expect(@order_form).to be_valid
    end
  end

  it "建物名がなくても保存できる" do
    @order_form.building = ''
    expect(@order_form).to be_valid
  end

  describe '商品購入' do
    it '郵便番号が空では登録できない' do
      @order_form.postal_code = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include "Postal code can't be blank" 
    end

    it '郵便番号が「3桁ハイフン4桁」以外の場合は保存不可' do
      @order_form.postal_code = '1234567'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)" 
    end

    it '地域が空だと出品できない' do
      @item.item_prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item prefecture can't be blank")
    end

    it '地域が1だと出品できない' do
      @item.item_scheduled_delivery_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Item scheduled delivery must be other than 1")
    end

    it '市区町村が空では登録できない' do
      @order_form.city = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include "City can't be blank" 
    end 

    it '番地が空では登録できない' do
      @order_form.address = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include "Address can't be blank" 
    end

    it '電話番号が空では登録できない' do
      @order_form.phone_number = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include "Phone number is invalid. Include hyphen(-)"
    end 

    it '電話番号が9桁以下では購入できない' do
      @order_form.phone_number = '123456789' # 9桁の電話番号
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include "Phone number is invalid. Include hyphen(-)"
    end

    it '電話番号が12桁以上では購入できない' do
      @order_form.phone_number = '1234567890123' # 12桁の電話番号
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include "Phone number is invalid. Include hyphen(-)"
    end

    it '電話番号に半角数字以外が含まれている場合は購入できない' do
      @order_form.phone_number = '123-4567-890A' # 半角数字以外が含まれている電話番号
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include "Phone number is invalid. Include hyphen(-)"
    end

    it 'tokenが空では購入できない' do
      @order_form.token = '' # 空のトークン
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include "Token can't be blank"
    end

    it 'userが紐付いていなければ購入できない' do
      @order_form.user_id = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include "User can't be blank"
    end
    
    it 'itemが紐付いていなければ購入できない' do
      @order_form.item_id = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include "Item can't be blank"
    end
    
  end
end
