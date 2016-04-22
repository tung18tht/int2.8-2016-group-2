class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :user_name
      t.string :age
      t.string :gender
      t.string :location
      t.text :intro
      t.text :interest
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
