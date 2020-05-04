class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :postal_code ,null: false
      t.string :prefecture,null: false
      t.string :city ,null: false
      t.string :block ,null: false
      t.string :building
      t.string :phone_number
      t.references :user,null: false, foreign_key: true
      t.string :send_first_name,null: false
      t.string :send_name,null: false
      t.string :send_first_name_kana,null: false
      t.string :send_name_kana,null: false

      t.timestamps
    end
    add_index :addresses, :phone_number, unique: true 
  end
end
