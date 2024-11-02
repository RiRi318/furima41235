class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image


  belongs_to_active_hash :category
  belongs_to_active_hash :situation
  belongs_to_active_hash :delivery
  belongs_to_active_hash :region
  belongs_to_active_hash :deliveryday

  validates :image, presence: true
  validates :name, presence: true
  validates :comment, presence: true
  validates :category_id, numericality: { other_than: 1 ,message: "can't be blank" }
  validates :situation_id, numericality: { other_than: 1 ,message: "can't be blank" }
  validates :delivery_id, numericality: { other_than: 1 ,message: "can't be blank" }
  validates :region_id, numericality: { other_than: 1 ,message: "can't be blank" }
  validates :deliveryday_id, numericality: { other_than: 1 ,message: "can't be blank" }
  validates :price, presence: true
  validates :price, numericality: { message: 'is not a number' }
  validates :price, numericality: { greater_than_or_equal_to: 300, message: 'must be at least 300' }, if: -> { price.is_a?(Integer) }
  validates :price, numericality: { less_than_or_equal_to: 9999999, message: 'must be less than or equal to 9999999' }, if: -> { price.is_a?(Integer) }
  validates :price, numericality: { only_integer: true, message: 'must be an integer' }

  private

  def image_presence
    errors.add(:image, "must be attached") unless image.attached?
  end


end
