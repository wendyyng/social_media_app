
class Like < ApplicationRecord
    belongs_to :user
    belongs_to :group_post
    validates(
      :group_post_id,
      uniqueness:{
        scope: :user_id,
        message: "has already been liked"
      }
    )
  end