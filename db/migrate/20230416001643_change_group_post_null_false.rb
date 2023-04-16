class ChangeGroupPostNullFalse < ActiveRecord::Migration[7.0]
  def change
    change_column :group_posts, :body, :text, null: false
  end
end