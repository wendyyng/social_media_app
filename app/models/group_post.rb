class GroupPost < ApplicationRecord
    belongs_to :user
    belongs_to :group

    has_many :comments, dependent: :destroy

    has_many :likes, dependent: :destroy
    has_many :likers, through: :likes, source: :user

    has_one_attached :image
    has_rich_text :body

    # validates :body, presence: true

    def image_as_thumbnail
        # return unless image.content_type.in?(%w[image/jpeg image/png image/gif])
        image.variant(resize_to_limit: [200, 200]).processed
    end
end