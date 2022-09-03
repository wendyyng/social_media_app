class AttendingEventsController < ApplicationController
    def new
        @event = Event.find(params[:id])

    end

    def create
        @event = Event.find(params[:id])
        @event.attendees << current_user
        if @event.save
            flash.notice = 'Registered successfully'
            redirect_to show_user_panel_path
        end
    end


end
