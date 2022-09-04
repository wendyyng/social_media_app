class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :group_post

    validates :body, length: {minimum: 3, maximum:200}
end
