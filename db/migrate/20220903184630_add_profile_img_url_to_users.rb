class AddProfileImgUrlToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :profile_img_url, :text, default: "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"
  end
end
