class RemoveUserIdIdFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_colum :orders, :user_id_id, :references
  end
end
