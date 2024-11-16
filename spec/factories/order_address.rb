FactoryBot.define do
  factory :order_address do
    postal_code     { '111-1111' }
    region_id       { 2 }
    region_city     { '北海道' }
    street_address  { '札幌市' }
    building_name   { '札幌1-1-1' }
    call            { '09012345678' }
    token           {"tok_abcdefghijk00000000000000000"}
  end
end