class AddImgUrlToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :img_url, :text, default: "https://images.pexels.com/photos/3719037/pexels-photo-3719037.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
  end
end
