class AddImgUrlToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :img_url, :text, default: "https://media.istockphoto.com/photos/business-people-having-a-meeting-picture-id1015934018?k=20&m=1015934018&s=612x612&w=0&h=9Q6gt-coI62h0uqok1FReHMhN_-M7ZhvyrTxNdEqGgg="
  end
end
