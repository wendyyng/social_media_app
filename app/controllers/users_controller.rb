class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:index, :show, :edit, :update, :user_panel]
    before_action :authorize_user!, only: [:edit]
    
    def index
        @users = User.all.order(created_at: :desc)
    end
    
    def new
        @user = User.new
    end

    def create
        @user = User.new params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :image, :address, :profile_img_url)

        if @user.save
            session[:user_id] = @user.id
            flash.notice = 'Signed up!'
            redirect_to root_path
        else
            render :new, status: 303
        end
    end

    
    def show
        @user = User.find params[:id]
        @friends = @user.friends
        @attended_events = current_user.attended_events
        @posts = @user.posts.order(created_at: :desc).limit(5)
    end

    def user_panel
        @received_requests = current_user.pending_invitations
        @sent_requests = current_user.invitations
        @friends = current_user.friends
        @organized_events = Event.where(organizer: current_user)
        @upcoming_events = current_user.attended_events
    end

    def edit
        @user = User.find params[:id]
    end

    def update
        @user = User.find params[:id]
        if @user.update(params.require(:user).permit(:first_name, :last_name, :email, :profile_img_url, :address))
            redirect_to show_user_panel_url(@user)
         else
          render :edit
        end
    end

    def destroy
        @user = User.find params[:id]
        @user.destroy
        flash[:notice]= "User has been removed!"
        redirect_to users_path
    end

    private

    def authorize_user!
        redirect_to root_path, alert: "Not authorized" unless params[:id].to_i == current_user.id || current_user.is_admin?
    end
end
