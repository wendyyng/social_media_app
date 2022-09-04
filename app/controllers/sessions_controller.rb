class SessionsController < ApplicationController
    def new

    end

    def create
        @user = User.find_by_email params[:email]
   
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect_to groups_path
        #   redirect_to groups_path, {notice: "Logged In"}
        else

          redirect_to new_sessions_path, {alert: "Wrong email or password!"}
        end
          # 
    end

    def destroy
        session[:user_id] = nil
        # flash.notice = 'Logged out'
        redirect_to root_path
    end
end
