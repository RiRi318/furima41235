require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end
  describe '購入情報の保存'do

  context '商品を購入できる時' do
    it 'すべてのバリデーションが通り、保存が成功すること' do
      expect(@order_address).to be_valid
      expect { @order_address.save }.to change(Order, :count).by(1)
    end

    it '建物名は空でも、保存が成功すること' do
      @order_address.building_name = ''
      expect(@order_address).to be_valid
    end
  end

  context '商品を購入できない時' do
    it 'userがログインしていなければ購入できない'do
    @order_address.user_id = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include "User can't be blank"
    end

    it 'itemのidがないときは購入できない'do
    @order_address.item_id = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include "Item can't be blank"
    end

    it '郵便番号が空では保存できない'do
    @order_address.postal_code = ''
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include "Postal code can't be blank"
    end

    it '郵便番号にハイフンが含まれていなければ保存できない'do
    @order_address.postal_code = 1234567
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
    end

    it '郵便番号が大文字では保存できない'do
    @order_address.postal_code = '１２３-４５６７'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
    end

    it '都道府県が空では保存できない'do
    @order_address.region_id = ''
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include "Region can't be blank"
    end

    it '都道府県が未選択では保存できない'do
    @order_address.region_id = 1
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include "Region can't be blank"
    end

    it '市区町村が空では保存できない'do
    @order_address.region_city = ''
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include "Region city can't be blank"
    end

    it '番地が空では保存できない'do
    @order_address.street_address = ''
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include "Street address can't be blank"
    end

    it '電話番号が空では保存できない'do
    @order_address.call = ''
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include "Call can't be blank"
    end

    it '電話番号が大文字では保存できない'do
    @order_address.call = '０９０１２３４５６７８'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include "Call is invalid. Please enter numbers only"
    end

    it '電話番号が１０桁未満では保存できない'do
    @order_address.call = 0123456
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include "Call is invalid. Please enter numbers only"
    end
    
    it '電話番号が１２桁以上では保存できない'do
    @order_address.call = 111111111111
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include "Call is invalid. Please enter numbers only"
    end
  end
  end
end