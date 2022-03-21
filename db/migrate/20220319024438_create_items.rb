class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :explanation
      t.integer :price
      t.boolean :is_active, default: true, null: false
      t.integer :genre_id
      t.timestamps
    end
  end
end
