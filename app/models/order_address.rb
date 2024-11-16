class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :region_id, :region_city, :street_address, :building_name, :call, :order, :token

  VALID_POSTAL_CODE_REGEX = /\A[0-9]{3}-[0-9]{4}\z/
  VALID_CALL_REGEX = /\A\d{10,11}\z/

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, presence: true
    validates :postal_code, format: {with: VALID_POSTAL_CODE_REGEX, message: "is invalid. Include hyphen(-)"}
    validates :region_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :region_city, presence: true
    validates :street_address, presence: true
    validates :call, presence: true
    validates :call, format: { with: VALID_CALL_REGEX,message: "is invalid. Please enter numbers only"}
    validates :token, presence: true
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, region_id: region_id, region_city: region_city, street_address: street_address, building_name: building_name, call: call, order_id: order.id)
  end
end