class ChangeBrandcolumnToAllowNull < ActiveRecord::Migration[5.0]
  def change
    def up
      change_column_null :brands, :name, true
    end
    def down
      change_column_null :brands, :name, false
    end
  end
end