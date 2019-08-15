class AddPhotosToCats < ActiveRecord::Migration[5.2]
  def change
    add_column :cats, :photos, :json
  end
end
