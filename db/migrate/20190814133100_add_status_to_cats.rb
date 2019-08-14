class AddStatusToCats < ActiveRecord::Migration[5.2]
  def change
    add_column :cats, :status, :integer, default: 0
  end
end
