class WelcomeController < ApplicationController
    def index
        @user_count = User.all.count
        @group_count = Group.all.count
        @event_count = Event.all.count
    end
end