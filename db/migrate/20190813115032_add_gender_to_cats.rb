class AddGenderToCats < ActiveRecord::Migration[5.2]
  def change
    add_column :cats, :gender, :string
  end
end
