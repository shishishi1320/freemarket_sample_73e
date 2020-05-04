class CreateBrands < ActiveRecord::Migration[5.0]
  def change
    create_table :brands, id: :integer do |t|
      t.string :name,null: false

      t.timestamps
    end

  end
end
