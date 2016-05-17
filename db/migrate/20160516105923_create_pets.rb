class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :animal
      t.boolean :mix, default: false
      t.integer :age
      t.string :sex
      t.string :description
      t.string :breeds
      t.boolean :is_pet_of_user, default: true
      t.string :shelter_id

      t.integer :user_id

      t.timestamps null: false
    end
  end
end
