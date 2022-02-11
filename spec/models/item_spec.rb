require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の保存' do
    context '商品が保存できる時' do
      it '商品画像、商品名、商品説明、カテゴリー、商品状態、配送料負担、発送元地域、発送までの日数、価格が入力されると保存できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が保存できない時' do
      it 'ユーザーが紐ついていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include( 'User must exist' )
      end

      it '画像が無いと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include( "Image can't be blank" )
      end

      it '商品名が無いと保存できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include( "Item name can't be blank" )
      end

      it '商品名が41文字以上だと保存できない' do
        @item.item_name = 'test' * 40
        @item.valid?
        expect(@item.errors.full_messages).to include( "Item name is too long (maximum is 40 characters)" )
      end

      it '商品説明が無いと保存できない' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include( "Detail can't be blank" )
      end

      it '商品説明が1001文字以上だと保存できない' do
        @item.detail = 'test' * 1000
        @item.valid?
        expect(@item.errors.full_messages).to include( "Detail is too long (maximum is 1000 characters)" )
      end

      it 'カテゴリーが初期値（---）だと保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include( "Category can't be blank" )
      end

      it '商品状態が初期値（---）だと保存できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include( "Condition can't be blank" )
      end

      it '配送料負担が初期値（---）だと保存できない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include( "Delivery charge can't be blank" )
      end

      it '発送元地域が初期値（---）だと保存できない' do
        @item.address_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include( "Address can't be blank" )
      end

      it '発送までの日数が初期値（---）だと保存できない' do
        @item.delivery_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include( "Delivery days can't be blank" )
      end

      it '価格が無いと保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include( "Price can't be blank" )
      end

      it '価格が299円以下だと保存できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include( "Price is out of setting range" )
      end

      it '価格が10,000,000円以上と保存できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include( "Price is out of setting range" )
      end

      it '価格が全角だと保存できない' do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include( "Price is invalid. Input half-width characters" )
      end
    end
  end
end
