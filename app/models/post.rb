class Post < ApplicationRecord
    belongs_to :user
    has_rich_text :description
    has_one_attached :image

    def image_as_thumbnail
        # return unless image.content_type.in?(%w[image/jpeg image/png image/gif])
        image.variant(resize_to_limit: [200, 200]).processed
    end
end