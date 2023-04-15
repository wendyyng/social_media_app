class Group < ApplicationRecord

    geocoded_by :address
    after_validation :geocode

    belongs_to :user

    has_many :group_posts, dependent: :destroy

    has_many :comments, through: :group_posts, dependent: :destroy

    has_many :memberships, dependent: :destroy
    has_many :users, through: :memberships

    # has_rich_text :description

    validates :title, presence: { message: "Body must be provided" }, length: { minimum: 3, too_short: "Title must be 3 characters minimum." }

end