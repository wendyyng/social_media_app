class Group < ApplicationRecord
    belongs_to :user

    has_many :group_posts, dependent: :destroy

    has_many :comments, through: :group_post, dependent: :destroy

    has_many :memberships, dependent: :destroy
    has_many :users, through: :memberships

    has_rich_text :description
end