class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string     :post_code,          null: false
      t.integer    :address_id,         null: false
      t.string     :municipalities,     null: false
      t.string     :house_number,       null: false
      t.string     :building
      t.string     :tel,                null: false
      t.references :order,              null: false, foreign_key: true
      t.timestamps
    end
  end
end
