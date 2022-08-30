class User < ApplicationRecord
    has_secure_password

    has_many :groups, dependent: :destroy
    has_many :group_posts, dependent: :nullify

    has_many :comments, dependent: :destroy

    # has_many :memberships
    # has_many :groups, through: :memberships

    def full_name
        if self.last_name
          self.first_name + " " + self.last_name
        elsif
          self.first_name
        end
      end
end