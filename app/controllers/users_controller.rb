class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:admin_panel, :edit, :update]
    before_action :authorize_user!, only: [:admin_panel, :edit]
    
    def new
        @user = User.new
    end

    def create
        @user = User.new params.require(:user).permit(:username, :email, :password, :password_confirmation)

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
        @allusers = User.all
    end
    
    private

    def authorize_user!
        redirect_to root_path, alert: "Not authorized" unless params[:id].to_i == current_user.id
    end
end
