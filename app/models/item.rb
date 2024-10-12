class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :condition
  belongs_to :shippingDay
  belongs_to :shippingFeeCharge

  validates :name, :content, :price, presence: true
  validates :category_id, :condition_id, :shipping_fee_charge_id, :area_id, :shipping_day_id,
            numericality: { other_than: 0, message: "can't be blank" }

  validates :price, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width integers' }
  validates :price,
            numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                            message: 'は300から999,999の範囲で入力してください' }
end
