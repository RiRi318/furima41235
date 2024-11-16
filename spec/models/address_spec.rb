require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    order = FactoryBot.create(:order)
    @address = FactoryBot.build(:address, order_id: order.id)
  end
  describe '配送先住所の保存'
  
  context '住所を保存できる時' do
    it 'すべてのバリデーションが通り、保存が成功すること' do
      expect(@address).to be_valid
      expect { @address.save }.to change(Address, :count).by(1)
    end
  end

  context '住所を保存できない時' do
    it '郵便番号が空では保存できない'do
    @address.postal_code = ''
    @address.valid?
    expect(@address.errors.full_messages).to include "Postal code can't be blank"
    end

    it '郵便番号にハイフンが含まれていなければ保存できない'do
    @address.postal_code = 1234567
    @address.valid?
    expect(@address.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
    end

    it '郵便番号にハイフンが含まれていなければ保存できない'do
    @address.postal_code = '１２３４５６７'
    @address.valid?
    expect(@address.errors.full_messages).to include "Postal code must be an integer"
    end

    it '都道府県が空では保存できない'do
    @address.region_id = ''
    @address.valid?
    expect(@address.errors.full_messages).to include "Region can't be blank"
    end

    it '都道府県が未選択では保存できない'do
    @address.region_id = 1
    @address.valid?
    expect(@address.errors.full_messages).to include "Region can't be blank"
    end

    it '市区町村が空では保存できない'do
    @address.region_city = ''
    @address.valid?
    expect(@address.errors.full_messages).to include "Region city can't be blank"
    end

    it '番地が空では保存できない'do
    @address.street_address = ''
    @address.valid?
    expect(@address.errors.full_messages).to include "Street address city can't be blank"
    end

    it '電話番号が空では保存できない'do
    @address.call = ''
    @address.valid?
    expect(@address.errors.full_messages).to include "Call can't be blank"
    end

    it '電話番号が大文字では保存できない'do
    @address.call = '０９０１２３４５６７８'
    @address.valid?
    expect(@address.errors.full_messages).to include "Call is invalid. Please enter numbers only"
    end

    it '電話番号が１０桁未満では保存できない'do
    @address.call = 0123456
    @address.valid?
    expect(@address.errors.full_messages).to include "Call is invalid. Please enter numbers only"
    end
    
    it '電話番号が１２桁以上では保存できない'do
    @address.call = 111111111111
    @address.valid?
    expect(@address.errors.full_messages).to include "Call is invalid. Please enter numbers only"
    end
  end
end