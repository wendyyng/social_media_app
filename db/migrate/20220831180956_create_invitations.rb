class CreateInvitations < ActiveRecord::Migration[7.0]
  def change
    create_table :invitations do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :friend_id
      t.boolean :confirmed, default: :false
      t.timestamps
    end
  end
end
