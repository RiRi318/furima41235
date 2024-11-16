require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  context '商品を購入できる時' do
    it 'すべてのバリデーションが通り、保存が成功すること' do
      expect(@order).to be_valid
      expect { @order.save }.to change(Order, :count).by(1)
    end
  end

  context '商品を購入できない時' do
    it 'userがログインしていなければ購入できない'do
    @order.user = nil
    @order.valid?
    expect(@order.errors.full_messages).to include "User must exist"
    end

    it 'itemのidがないときは購入できない'do
    @order.item = nil
    @order.valid?
    expect(@order.errors.full_messages).to include "Item must exist"
    end
  end
end
