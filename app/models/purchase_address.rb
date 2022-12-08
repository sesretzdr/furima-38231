class PurchaseAddress
  include ActiveModel::Model

  attr_accessor :user_id, :product_id, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :postal_code, format: { with: /\d{3}-\d{4}/, message: 'Input correctly' }
    validates :prefecture_id, numericality: { other_than: 0, message: 'select' }
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /(0{1}\d{9,10})/ }
  end

  def save
    @purchase = Purchase.create!(user_id: user_id, product_id: product_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_id: @purchase.id)
  end
end