require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  before do
    @purchase_shipping = FactoryBot.build(:purchase_shipping)
  end
  describe '購入・配送先登録' do
    context '新規登録できるとき' do
      it 'item_id, user_id, zip, area_id, city, street_address, building_name, telephone_number, purchase_idが存在すれば登録できる' do
        expect(@purchase_shipping).to be_valid
      end
      it 'building_nameのみ存在しなくても登録できる' do
        @purchase_shipping.building_name = ''
        expect(@purchase_shipping).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'item_idが空では登録できない' do
        @purchase_shipping.item_id = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Item can't be blank")
      end
      it 'user_idが空では登録できない' do
        @purchase_shipping.user_id = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("User can't be blank")
      end
      it 'zipが空では登録できない' do
        @purchase_shipping.zip = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Zip can't be blank")
      end
      it 'area_idが0では登録できない' do
        @purchase_shipping.area_id = 0
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Area can't be blank")
      end
      it 'cityが空では登録できない' do
        @purchase_shipping.city = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("City can't be blank")
      end
      it 'street_addressが空では登録できない' do
        @purchase_shipping.street_address = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Street address can't be blank")
      end
      it 'telephone_numberが空では登録できない' do
        @purchase_shipping.telephone_number = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @purchase_shipping.token = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Token can't be blank")
      end
      it 'zipが郵便番号意外では登録できない' do
        @purchase_shipping.zip = '123-123456'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Zip is invalid. Include both letters and numbers')
      end
      it 'cityが全角意外では登録できない' do
        @purchase_shipping.city = '12345'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('City is invalid. Input full-width characters')
      end
      it 'street_addressが正しくなければ登録できない' do
        @purchase_shipping.street_address = '@@@@@@@'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Street address is invalid. Input full-width and half-width characters')
      end
      it 'telephone_numberが電話番号の形式意外では登録できない' do
        @purchase_shipping.telephone_number = 'abcdefg'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Telephone number is invalid. Include both letters and numbers')
      end
    end
  end
end
