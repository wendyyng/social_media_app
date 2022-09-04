class EventsController < ApplicationController
    def index
        @events = Event.all
    end

    def show
        @event = Event.find params[:id]
    end

    def new
        @event = Event.new
    end

    def create
        @event = Event.new(event_params)
        @event.organizer = current_user
        
        if @event.save
            flash[:notice]= "Event created successfully!"
            redirect_to event_path(@event)
        else
            flash[:error] = "Invalid Event"
            render :new
        end
    end

    private

    def event_params
        params.require(:event).permit(:title, :description, :date, :location, )
    end
end
