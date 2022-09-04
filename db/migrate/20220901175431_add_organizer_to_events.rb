class AddOrganizerToEvents < ActiveRecord::Migration[7.0]
  def change
    add_reference :events, :organizer, null:false
    add_foreign_key :events, :users, column: :organizer_id
  end
end
