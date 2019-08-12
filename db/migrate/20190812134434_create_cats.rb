class CreateCats < ActiveRecord::Migration[5.2]
  def change
    create_table :cats do |t|
      t.string :name
      t.string :description
      t.string :address
      t.string :photo
      t.string :bread
      t.integer :age
      t.integer :price_per_day
      t.references :user_id, foreign_key: true

      t.timestamps
    end
  end
end
