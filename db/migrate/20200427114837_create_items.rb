class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items, id: :integer do |t|
      t.string :name ,null: false
      t.integer :price,null: false
      t.text :text,null: false
      t.integer :status,null: false
      t.integer :size,null: false
      t.references :brand, null: false, foreign_key: true
      t.integer :condition,null: false
      t.integer :shipping_cost,null: false
      t.integer :delivery_method,null: false
      t.integer :delivery_area,null: false
      t.integer :delivery_date,null: false
      t.references :category, null: false,foreign_key: true
      t.integer :seller_id,null: false
      t.integer :buyer_id

      t.timestamps
    end
    add_index :items, :name 

  end
end
