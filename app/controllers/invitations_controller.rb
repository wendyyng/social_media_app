class InvitationsController < ApplicationController
  before_action :authenticate_user!

  def create
      id1 = params[:ids][:id1]
      id2 = params[:ids][:id2]
      @invitation = Invitation.new(user_id: id1, friend_id: id2)
      if @invitation.save
        flash[:notice]= "Friend request has been sent successfully!"
        redirect_to show_user_panel_path
      else
        flash[:error] = "Error!"
      end
    end
  
    def destroy
      invitation = Invitation.find(params[:invitation_id])
      if invitation.destroy
        flash[:notice]= "Invitation deleted successfully!"
      end
      redirect_to show_user_panel_path
    end

    def destroy_from_panel
      invitation = Invitation.find(params[:invitation_id])
      if invitation.destroy
        flash[:notice]= "Invitation deleted successfully!"
      end
      redirect_to show_user_panel_path
    end
  
    def update
      invitation = Invitation.find(params[:invitation_id])
      p current_user
      invitation.update(confirmed: true)
      redirect_to show_user_panel_path
    end

    def unsent
      invitation = Invitation.find(params[:invitation_id])
      if invitation.destroy
        flash[:notice]= "Invitation deleted successfully!"
      end
      redirect_to show_user_panel_path
    end
    
  end