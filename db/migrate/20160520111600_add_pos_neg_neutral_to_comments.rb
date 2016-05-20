class AddPosNegNeutralToComments < ActiveRecord::Migration
  def change
    add_column :comments, :pos, :decimal
    add_column :comments, :neg, :decimal
    add_column :comments, :neutral, :decimal
    add_column :comments, :label, :string
  end
end
