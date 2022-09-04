class EventsController < ApplicationController
    def index
        @events = Event.future.order(created_at: :desc)
    end

    def show
        @event = Event.find params[:id]
        @distance = event_user_distance_km(@event, current_user)
    end

    def new
        @event = Event.new
    end

    def create
        @event = Event.new(event_params)
        @event.organizer = current_user
        @event.attendees << current_user

        if @event.save
            flash[:notice]= "Event created successfully!"
            redirect_to event_path(@event)
        else
            flash[:error] = "Invalid Event"
            render :new
        end
    end

    def edit
        @event = Event.find params[:id]
    end

    def update
        @event = Event.find params[:id]
        if @event.update(event_params)
            redirect_to event_path(@event)
         else
          render :edit
        end

    end

    private

    def event_params
        params.require(:event).permit(:title, :description, :date, :location, )
    end

    def event_user_distance_km(event, user)
        if event.longitude && user.longitude
          rkm = 6371; #Radius of the earth in km
          rad_per_deg = Math::PI/180  # PI / 180
    
          elon = event.longitude
          elat = event.latitude
          ulon = user.longitude
          ulat = user.latitude
    
          # first add our own radians function since Ruby Math does not have one
          radians = -> (degrees) { degrees * (Math::PI / 180)}
    
          # convert latitude degrees to radians
          phi_1 = elat * rad_per_deg;
          phi_2 = ulat * rad_per_deg;
    
          # delta being the "difference" between the latitudes and longitudes of each coordinate set expressed
          # in radians
          delta_phi = radians.call(ulat - elat);
          delta_lambda = radians.call(ulon - elon);
    
          # sin²(φB - φA/2) + cos φA * cos φB * sin²(λB - λA/2)
          a = Math.sin(delta_phi/2.0)**2 + Math.cos(phi_1) * Math.cos(phi_2) * Math.sin(delta_lambda/2.0)**2;
    
          # 2 * atan2( √a, √(1−a) )
          c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    
          kilometers = (rkm * c).round(2)
  
        end
        
      end
end
