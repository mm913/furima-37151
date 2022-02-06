class Item < ApplicationRecord
  belongs_to :user
  extend AcriveHash::Associations::AcriveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :address
  belongs_to :delivery_days
end
