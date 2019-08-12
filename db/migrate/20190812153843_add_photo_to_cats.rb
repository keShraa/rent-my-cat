class AddPhotoToCats < ActiveRecord::Migration[5.2]
  def change
    add_column :cats, :photo, :string
  end
end
