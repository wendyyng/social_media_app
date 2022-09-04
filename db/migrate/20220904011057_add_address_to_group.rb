class AddAddressToGroup < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :address, :string
  end
end
