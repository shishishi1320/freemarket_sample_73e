class DeleteAddressIdUniqIndexFromPhone < ActiveRecord::Migration[5.2]
  def change
     remove_index :addresses, :phone_number_id
  end
end
