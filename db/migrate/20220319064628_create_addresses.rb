class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|

#3/19崎田　配送先のデータ登録のためモデルを作成
      t.integer :customer_id
      t.string :name
      t.string :postal_code
      t.string :addresses

      t.timestamps
    end
  end
end
