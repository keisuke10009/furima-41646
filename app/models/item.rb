class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :area
  belongs_to :category
  belongs_to :condition
  belongs_to :shippingDay
  belongs_to :shippingFeeCharge
  has_one_attached :image

  validates :image, :name, :explanation, :price, presence: true
  validates :category_id, :condition_id, :shipping_fee_charge_id, :area_id, :shipping_day_id,
            numericality: { other_than: 0, message: "can't be blank" }

  validates :price, numericality: { only_integer: true, message: 'is not a number' }
  validates :price,
            numericality: { greater_than_or_equal_to: 300,
                            message: 'must be greater than or equal to 300' }
  validates :price,
            numericality: { less_than_or_equal_to: 9_999_999,
                            message: 'must be less than or equal to 9999999' }
end
