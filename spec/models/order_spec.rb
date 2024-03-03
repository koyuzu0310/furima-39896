require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @order_form = FactoryBot.build(:order_form)
  end

  context '購入できる場合' do
    it '必要事項を全て入力すると購入できる' do
      expect(@item).to be_valid
    end
  end

    context '内容に問題ない場合' do
      it "tokenがあれば保存ができること" do
        expect(@order_form).to be_valid
      end
    end



  describe '商品購入' do
    before do
      #@order_form = OrderForm.new
      @order_form = FactoryBot.build(:order_form)
    end

    it '郵便番号が空では登録できない' do
      @order_form.postal_code = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include "Postal code can't be blank" 
    end

    it '郵便番号が「3桁ハイフン4桁」以外の場合は保存不可' do
      @order_form = OrderForm.new(postal_code: '1234567')
      expect(@order_form).not_to be_valid
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
      expect(@order_form.errors.full_messages).to include "Address can't be blank" # "Postal code" に変更
    end

   
    it '電話番号が空では登録できない' do
      @order_form.phone_number = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include "Phone number is invalid. Include hyphen(-)"
    end 
    
   


end
end	