class User < ApplicationRecord
    has_secure_password

    has_many :groups, dependent: :destroy
    has_many :group_posts, dependent: :nullify

    has_many :comments, dependent: :destroy

    has_many :memberships
    has_many :groups, through: :memberships

    # has_many :friendships, dependent: :destroy  
    # has_many :friends, through: :friendships

    has_one_attached :image

      has_many :invitations
    has_many :pending_invitations, -> { where confirmed: false }, class_name: 'Invitation', foreign_key: "friend_id"

    def friends
      friends_i_sent_invitation = Invitation.where(user_id: id, confirmed: true).pluck(:friend_id)
      friends_i_got_invitation = Invitation.where(friend_id: id, confirmed: true).pluck(:user_id)
      ids = friends_i_sent_invitation + friends_i_got_invitation
      User.where(id: ids)
    end

    def friend_with?(user)
      Invitation.confirmed_record?(id, user.id)
    end

    def send_invitation(user)
      invitations.create(friend_id: user.id)
    end

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