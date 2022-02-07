class Item < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :address
  belongs_to :delivery_days
  has_one_attached :image

  validates :item_name,          presence: true, length: { maximum: 40 }
  validates :detail,             presence: true, length: { maximum: 1000 }
  validates :category_id,        numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id,       numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_charge_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :address_id,         numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_days_id,   numericality: { other_than: 1, message: "can't be blank" }
  with_options presence: true, format: {with: /\A[0-9]+\z/ } do
    validates :price, numericality: {
       only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
       presence: { message: "can't be blank" }
  end
end
