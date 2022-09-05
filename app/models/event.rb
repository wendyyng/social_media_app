class Event < ApplicationRecord
    belongs_to :organizer, class_name: "User"
    validates_presence_of :title
    validates_presence_of :date
    validate :date_cannot_be_in_the_past
    # has_one_attached :image
    has_many :attending_events
    has_many :attendees, through: :attending_events, source: :user
    
    scope :future, -> {where('date > ?', Time.now)}
    scope :past,   -> {where('date < ?', Time.now)}

    geocoded_by :location
    #We are stating here that we are converting the address to geocode
    #when a user saves an address, it will automatically convert it to latitude and longitude as well
    after_validation :geocode

    def date_cannot_be_in_the_past
        errors.add(:date, { message: "Can't be in the past" }) if
          !date.blank? and date < Date.today

    end
end
