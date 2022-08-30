class Membership < ApplicationRecord

    belongs_to :group
    belongs_to :user

    validates(
        :group_id,
        uniqueness:{
          scope: :user_id,
          message: "has already been joined"
        }
      )
end