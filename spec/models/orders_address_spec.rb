require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address,user_id: user.id,item_id: item.id)
  end
  describe '購入機能' do
  context '内容に問題ない場合' do
  it "問題なく購入出来る" do
    expect(@order_address).to be_valid
  end
end

  context '建物名がなくても登録できる場合' do
  it '建物名が空でも保存できる' do
    @order_address.building = ''
    expect(@order_address).to be_valid
      end
    end
  context '内容に問題がある場合' do
    it "郵便番号が空では保存ができないこと" do
      @order_address.postal_code = ''
      @order_address.valid?
      expect(@order_address.errors[:postal_code]).to include("can't be blank")
    end

    it '郵便番号が半角のハイフンを含んだ正しい形式でないと登録ができない' do
      @order_address.postal_code = '1234567'
      @order_address.valid?
      expect(@order_address.errors[:postal_code]).to include("is invalid")
    end

    it '都道府県が空では登録できない' do
      @order_address.prefecture_id = nil
      @order_address.valid?
      expect(@order_address.errors[:prefecture_id]).to include("can't be blank")
    end
  
    it '市町村が空では登録できない' do
      @order_address.city = ''
      @order_address.valid?
      expect(@order_address.errors[:city]).to include("can't be blank")
    end
  
    it '番地が空では登録できない' do
      @order_address.address = ''
      @order_address.valid?
      expect(@order_address.errors[:address]).to include("can't be blank")
    end
  
    it '電話番号が空では登録できない' do
      @order_address.phone_number = ''
      @order_address.valid?
      expect(@order_address.errors[:phone_number]).to include("can't be blank")
    end
  
    it '電話番号が12桁以上では登録できない' do
      @order_address.phone_number = '111111111111'
      @order_address.valid?
      expect(@order_address.errors[:phone_number]).to include("is too long (maximum is 11 characters)")
    end
    it '半角英数字が含まれている場合、登録できない' do
      @order_address.phone_number = 'abc'
      @order_address.valid?
      expect(@order_address.errors[:phone_number]).to include("is too short (minimum is 10 characters)")
    end
    it 'user_idが空では登録できない' do
      @order_address.user_id = nil
      @order_address.valid?
      expect(@order_address.errors[:user_id]).to include("can't be blank")
    end
    it 'item_idが空では登録できない' do
      @order_address.item_id = ''
      @order_address.valid?
      expect(@order_address.errors[:item_id]).to include("can't be blank")
      end
    it 'tokenが空では登録できない' do
      @order_address.token = ''
      @order_address.valid?
      expect(@order_address.errors[:token]).to include("can't be blank")
      end
      it '電話番号が9桁以下では登録できない' do
        @order_address.phone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors[:phone_number]).to include('is too short (minimum is 10 characters)')
      end

    end
  end
end