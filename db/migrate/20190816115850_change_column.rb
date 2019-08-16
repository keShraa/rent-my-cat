class ChangeColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :messages, :published_at
    add_column :messages, :published_at, :string
  end
end
