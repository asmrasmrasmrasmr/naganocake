class AddIsActiveToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :is_active, :boolean, default: true, null: false
  end
end
