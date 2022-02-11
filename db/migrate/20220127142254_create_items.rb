class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :item_name,          null: false
      t.text       :detail,             null: false
      t.integer    :category_id ,       null: false
      t.integer    :condition_id,       null: false
      t.integer    :delivery_charge_id, null: false
      t.integer    :address_id,         null: false
      t.integer    :delivery_days_id,   null: false
      t.integer    :price,              null: false
     
      t.timestamps
    end
  end
end

# user_idは、"rails g migration AddUserIdToItems" で追加済み