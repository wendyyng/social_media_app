class AddAddressToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :address, :string, default: "1895 Lower Mall, Vancouver, BC V6T 1Z4"
  end
end
