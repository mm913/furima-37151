class OrderDelivery
  include ActiveModel::Model
  atr_accessor :post_code, :address_id, :municipalities, :house_number, 
               :building, :tel, :order_id, :user_id, :item_id
  
  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipalities
    validates :house_number
    validates :tel, format: {with: /\A[0-9]{10,11}\z/, message: "is too short"}
  end
  validates :tel,        numericality: { only_integer: true, message: 'is invalid. Input only number' }
  validates :address_id, numericality: { other_than: 1, message: "can't be blank" }
end