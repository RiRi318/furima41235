FactoryBot.define do
  factory :item do
    name            {'テスト'}
    comment         {'コメント'}
    category_id     {'2'}
    situation_id    {'2'}
    delivery_id     {'2'}
    region_id       {'2'}
    deliveryday_id  {'2'}
    price           {'2000'}
    association     :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png' )
    end
  end
end
