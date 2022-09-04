class Event < ApplicationRecord
    belongs_to :organizer, class_name: "User"
    validates_presence_of :title
    validates_presence_of :date
    # has_one_attached :image
    has_many :attending_events
    has_many :attendees, through: :attending_events, source: :user
    
    scope :future, -> {where('date > ?', Time.now)}
    scope :past,   -> {where('date < ?', Time.now)}

    geocoded_by :location
    #We are stating here that we are converting the address to geocode
    #when a user saves an address, it will automatically convert it to latitude and longitude as well
    after_validation :geocode
end
