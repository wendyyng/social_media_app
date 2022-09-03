class Event < ApplicationRecord
    belongs_to :organizer, class_name: "User"
    validates_presence_of :title
    validates_presence_of :date
    # has_one_attached :image
    has_many :attending_events
    has_many :attendees, through: :attending_events, source: :user
    
end
