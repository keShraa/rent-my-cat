class DeletePhoto < ActiveRecord::Migration[5.2]
  def change
    remove_column :cats, :photo
  end
end
