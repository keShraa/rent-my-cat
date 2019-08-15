class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :description
      t.integer :rating, default: 0
      t.references :user, foreign_key: true
      t.references :cat, foreign_key: true

      t.timestamps
    end
  end
end
