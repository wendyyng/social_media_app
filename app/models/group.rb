class Group < ApplicationRecord
    belongs_to :user

    has_many :group_posts

    # has_many :memberships
    # has_many :users, through: :memberships
end