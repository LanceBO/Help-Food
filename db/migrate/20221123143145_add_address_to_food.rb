class AddAddressToFood < ActiveRecord::Migration[7.0]
  def change
    add_column :foods, :address, :string
  end
end
