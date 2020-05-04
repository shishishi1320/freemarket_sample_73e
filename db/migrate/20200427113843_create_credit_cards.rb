class CreateCreditCards < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_cards do |t|
      t.integer :card_id
      t.integer :customer_id
      t.references :user, null: false,foreign_key: true

      t.timestamps
    end
  end
end
