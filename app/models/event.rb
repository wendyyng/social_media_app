class Event < ApplicationRecord
    belongs_to :organizer, class_name: "User"
    validates_presence_of :title

    has_one_attached :image
    
end
