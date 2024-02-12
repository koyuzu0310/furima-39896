require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user) # FactoryBotでテスト用のUserオブジェクトを作成
    end
    context '新規登録できる場合' do
      it '必要事項を全て入力すると新規登録できる' do
        expect(@user).to be_valid
      end
    end


  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
  end

  it 'passwordとpassword_confirmationが不一致では登録できない' do
    @user.password = '123456'
    @user.password_confirmation = '1234567'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

  it 'emailは@を含まないと登録できない' do
    @user.email = 'testmail'
    @user.valid?
    expect(@user.errors.full_messages).to include('Email is invalid')
  end

  it 'passwordで英字のみでは登録できない' do
    @user.password = 'aaaaa'
    @user.password_confirmation = 'aaaaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid")
  end

  it 'passwordで数字のみでは登録できない' do
    @user.password = '000000'
    @user.password_confirmation = '000000'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is invalid')
  end

  it '全角文字を含むパスワードでは登録できない' do
    @user.password = 'ａａa １１1'
    @user.password_confirmation = 'ａａa １１1'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is invalid')
  end

  it 'passwordが5文字以下では登録できない' do
    @user.password = '00000'
    @user.password_confirmation = '00000'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
  end

  it 'passwordが129文字以上では登録できない' do
    @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
    @user.password_confirmation = @user.password
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
  end

  it '名前(全角)は、名前が空では登録できない' do
    @user.last_name = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("Last name can't be blank")
  end

  it 'お名前(全角)は、名前が空では登録できない' do
    @user.first_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("First name can't be blank")
  end

  it 'お名前(全角)は、名字を全角（漢字・ひらがな・カタカナ）で入力しないと登録できない' do
    @user.last_name = 'ﾔﾏﾀﾞ'
    @user.valid?
    expect(@user.errors.full_messages).to include('Last name is invalid')
  end

  it 'お名前(全角)は、名前を全角（漢字・ひらがな・カタカナ）で入力しないと登録できない' do
    @user.first_name = 'ﾀﾛｳ'
    @user.valid?
    expect(@user.errors.full_messages).to include('First name is invalid')
  end

  it 'お名前カナ(全角)は、名字が空では登録できない' do
    @user.last_name_kana = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name kana can't be blank")
  end

  it 'お名前カナ(全角)は、名前が空では登録できない' do
    @user.first_name_kana = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana can't be blank")
  end

  it 'お名前カナ(全角)は、名字を全角（カタカナ）で入力しないと登録できない' do
    @user.last_name_kana = 'ﾔﾏﾀﾞ'
    @user.valid?
    expect(@user.errors.full_messages).to include('Last name kana is invalid')
  end

  it 'お名前カナ(全角)は、名前を全角（カタカナ）で入力しないと登録できない' do
    @user.first_name_kana = 'ﾀﾛｳ'
    @user.valid?
    expect(@user.errors.full_messages).to include('First name kana is invalid')
  end

  it '生年月日が空だと登録できない' do
    @user.birth_data = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Birth data can't be blank")
  end
  
end
end
end