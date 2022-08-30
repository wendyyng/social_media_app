class Group < ApplicationRecord
    belongs_to :user

    has_many :group_posts
    has_many :comments, through: :group_post

    # has_many :memberships
    # has_many :users, through: :memberships
end