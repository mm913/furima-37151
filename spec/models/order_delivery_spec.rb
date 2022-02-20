require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  describe '購入者情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_delivery = FactoryBot.build(:order_delivery, user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it '全ての値が正しく入力されていれば保存できる事' do
        expect(@order_delivery).to be_valid
      end
      it '建物名は空でも保存できる事' do
        @order_delivery.building = ''
        expect(@order_delivery).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "クレジットカード情報が空では保存できない" do
        @order_delivery.token = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空では保存できない' do
        @order_delivery.post_code = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号にハイフンが無いと保存できない' do
        @order_delivery.post_code = '1234567'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Post code input correctly")
      end
      it '郵便番号が全角数字だと保存できない' do
        @order_delivery.post_code = '１２３ー４５６７'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Post code input correctly")
      end
      it '都道府県が初期値(---)では保存できない' do
        @order_delivery.address_id = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Address can't be blank")
      end
      it '市区町村が空では保存できない' do
        @order_delivery.municipalities = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '番地が空では保存できない' do
        @order_delivery.house_number = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空では保存できない' do
        @order_delivery.tel = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Tel can't be blank")
      end
      it '電話番号にハイフンがあると保存できない' do
        @order_delivery.tel = '090-0000-0000'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Tel is invalid. Input only number")
      end
      it '電話番号が10桁未満では保存できない' do
        @order_delivery.tel = '012345678'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Tel is too short")
      end
      it '電話番号が12桁以上では保存できない' do
        @order_delivery.tel = '012345678912'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Tel is too short")
      end
    end
  end
end
