class RenameLastNameColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :last_name, :first_name
  end
end
