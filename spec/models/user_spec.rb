require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

 describe 'ユーザー新規登録' do
  it 'nickname、email、password、password_confirmation、family_name、first_name、family_name_kana、first_name_kana、birthdayが存在すれば登録できる' do
  end

  it 'nicknameが空では登録できない' do
  end

  it 'emailが空では登録できない' do
  end

  it 'emailが重複すると登録できない' do
  end

  it 'emailは@を含まないと登録できない' do
  end

  it 'passwordが空では登録できない' do
  end

  it 'passwordは6文字以上でないと登録できない' do
  end

  it 'passwordは半角英数字混同でないと登録できない' do
  end

  it 'passwordとpassword_confirmationが不一致では登録できない' do
  end

  it 'family_nameとfirst_nameが空では登録できない' do
  end

  it 'family_nameとfirst_nameは全角でないと登録できない' do
  end

  it 'family_name_kanaとfirst_name_kanaが空では登録できない' do
  end

  it 'family_name_kanaとfirst_name_kanaは全角（カタカナ）でないと登録できない' do
  end

  it 'birthdayが空では登録できない' do
  end