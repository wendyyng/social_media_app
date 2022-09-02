class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:index, :show, :edit, :update, :user_panel]
    before_action :authorize_user!, only: [:edit]
    
    def new
        @user = User.new
    end

    def create
        @user = User.new params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :image)

        if @user.save
            session[:user_id] = @user.id
            flash.notice = 'Signed up!'
            redirect_to root_path
        else
            render :new, status: 303
        end
    end

    def index
        @users = User.all.order(created_at: :desc)
    end
    
    def show
        @user = User.find params[:id]
        @friends = @user.friends

    end

    def user_panel
      @received_requests = current_user.pending_invitations
      @sent_requests = current_user.invitations
      @friends = current_user.friends
    end

    def edit
        @user = User.find params[:id]
    end

    def update
        if @user.update(params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :image))
            redirect_to show_user_panel(@user)
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
