require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:item) { FactoryBot.build(:item, user: user) }

  describe '商品出品' do

    before do
     item.image.attach(io: File.open(Rails.root.join('test', 'fixtures', 'image.jpg')), filename: 'image.jpg', content_type: 'image/jpeg')
    end

    context '正常に出品できる場合' do
      it '全ての情報が正しく入力されていると出品できる' do
        item = FactoryBot.build(:item, user: user)
        item.image.attach(io: File.open(Rails.root.join('test', 'fixtures', 'image.jpg')), filename: 'image.jpg', content_type: 'image/jpeg')
        expect(item).to be_valid
      end
    end

    context '出品ができない場合' do
      it '商品画像がない場合、出品できない' do
        item = FactoryBot.build(:item, user: user, image: nil)
        item.valid?
        expect(item.errors.full_messages).to include "Image can't be blank"
      end

      it '商品名がない場合、出品できない' do
        item = FactoryBot.build(:item, user: user, name: nil)
        item.valid?
        expect(item.errors.full_messages).to include "Name can't be blank"
      end

      it '商品説明がない場合、出品できない' do
        item = FactoryBot.build(:item, user: user, description: nil)
        item.valid?
        expect(item.errors.full_messages).to include "Description can't be blank"
      end

      it 'カテゴリーが選択されていない場合、出品できない' do
        item = FactoryBot.build(:item, user: user, category_id: '')
        item.valid?
        expect(item.errors.full_messages).to include "Category can't be blank"
      end
      it "ジャンルが未選択の場合、登録できない" do
        item = FactoryBot.build(:item, category_id: nil)
        item.valid?
        expect(item.errors.full_messages).to include "Category can't be blank"
      end
      it '商品状態が選択されていない場合、出品できない' do
        item = FactoryBot.build(:item, user: user, product_condition_id: nil)
        item.valid?
        expect(item.errors.full_messages).to include "Product condition can't be blank"
      end

      it '価格が範囲外の場合、出品できない' do
        item = FactoryBot.build(:item, user: user, price: 999_999_999)
        item.valid?
        expect(item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end

      it '価格が範囲外の場合、出品できない' do
        item = FactoryBot.build(:item, user: user, price: 200)
        item.valid?
        expect(item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end

      it '価格が数字以外の場合、出品できない' do
        item = FactoryBot.build(:item, user: user, price: 'ABC')
        item.valid?
        expect(item.errors.full_messages).to include "Price is not a number"
      end
      it 'userが紐づいていないと、出品できない' do
        item = FactoryBot.build(:item, user: nil)
        item.valid?
        expect(item.errors.full_messages).to include "User must exist"
      end
    end
  end
end