class UpdateUsers < ActiveRecord::Migration
  def change
    add_column :users, :zip, :string, null: false, default: "94112"
  end
end
