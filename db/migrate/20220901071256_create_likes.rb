class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true, index:true
      t.references :group_post, null: false, foreign_key: true, index:true
      t.timestamps
    end
  end
end
