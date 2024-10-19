class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :zip, :area_id, :city, :street_address, :building_name, :telephone_number, :purchase_id,
                :price, :token

  validates :item_id, :user_id, :token, presence: true
  validates :zip, presence: true,
                  format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include both letters and numbers' }
  validates :area_id, numericality: { other_than: 0, message: "can't be blank" }

  validates :city, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/,
                                             message: 'is invalid. Input full-width characters' }
  validates :street_address, presence: true, format: { with: /\A[ぁ-ゖァ-ヶ一-龥ｦ-ﾟ0-9０-９ー-]+\z/,
                                                       message: 'is invalid. Input full-width and half-width characters' }

  validates :telephone_number, presence: true,
                               format: { with: /\A\d{10,11}\z/, message: 'is invalid. Include both letters and numbers' }

  def save
    purchase = Purchase.create(item_id: @item_id, user_id: @user_id)
    Shipping.create(zip: @zip, area_id: @area_id, city: @city, street_address: @street_adress, building_name: @building_name,
                    telephone_number: @telephone_number, purchase_id: purchase.id)
  end
end
