class User < ApplicationRecord
    has_secure_password

    has_many :groups, dependent: :destroy
    has_many :group_posts, dependent: :nullify

    has_many :comments, dependent: :destroy

    has_many :memberships
    has_many :groups, through: :memberships

    has_many :friendships
    has_many :friends, :through => :friendships

    has_one_attached :image

    def image_as_thumbnail
      # return unless image.content_type.in?(%w[image/jpeg image/png image/gif])
      image.variant(resize_to_limit: [200, 200]).processed
    end

    def full_name
        if self.last_name
          self.first_name + " " + self.last_name
        elsif
          self.first_name
        end
      end
end