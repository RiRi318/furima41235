require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '商品が保存できる時' do
    it 'すべてのバリデーションが通り、保存が成功すること' do
      expect(@item).to be_valid
      expect { @item.save }.to change(Item, :count).by(1)
    end
  end

  context '商品が保存できない時' do
    it '商品画像が空では保存できない'do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include ("Image can't be blank")
    end
    it '商品名が空では登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Name can't be blank"
    end
    it 'コメントが空では登録できない' do
      @item.comment = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Comment can't be blank"
    end
    it 'カテゴリーが空では登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end
    it 'カテゴリーが未選択では登録できない' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end
    it '商品の状態が空では登録できない' do
      @item.situation_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Situation can't be blank"
    end
    it '商品の状態が未選択では登録できない' do
      @item.situation_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include "Situation can't be blank"
    end
    it '配送料の負担が空では登録できない' do
      @item.delivery_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Delivery can't be blank"
    end
    it '配送料の負担が未選択では登録できない' do
      @item.delivery_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include "Delivery can't be blank"
    end
    it '発送元の地域が空では登録できない' do
      @item.region_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Region can't be blank"
    end
    it '発送元の地域が未選択では登録できない' do
      @item.region_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include "Region can't be blank"
    end
    it '発送までの日数が空では登録できない' do
      @item.deliveryday_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Deliveryday can't be blank"
    end
    it '発送までの日数が未選択では登録できない' do
      @item.deliveryday_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include "Deliveryday can't be blank"
    end
    it '販売価格が空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end
    it '販売価格が大文字では登録できない' do
      @item.price = '１１１'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be an integer"
    end
    it '販売価格が300円未満では登録できない' do
      @item.price = '100'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be at least 300"
    end
    it '販売価格が9999999円以上では登録できない' do
      @item.price = '9999999999'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
    end
    it 'userが紐づいていないと登録できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "User must exist"
    end
  end
end
