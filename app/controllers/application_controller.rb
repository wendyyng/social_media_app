require 'action_text'

class ApplicationController < ActionController::Base
    helper ActionText::Engine.helpers
    before_action :set_query

    def set_query
        @query = Group.ransack(params[:q])
    end

    def current_user
        @current_user ||=User.find_by_id session[:user_id]
    end
    helper_method :current_user

    def user_signed_in?
        current_user.present? 
    end
    helper_method :user_signed_in?

    def authenticate_user!
        redirect_to new_sessions_path, notice: 'Please sign in' unless user_signed_in?
    end
end
