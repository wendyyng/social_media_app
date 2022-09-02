class EventsController < ApplicationController
    def index

    end

    def show

    end

    def new
        @event = current_user.created_events.build
    end

    def create
        @event = current_user.created_events.build(event_params)
        
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
        params.require(:event).permit(:title, :date, :location)
    end
end
