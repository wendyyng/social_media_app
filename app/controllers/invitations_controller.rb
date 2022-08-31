class InvitationsController < ApplicationController
    def create
      id1 = params[:ids][:id1]
      id2 = params[:ids][:id2]
      @invitation = Invitation.new(user_id: id1, friend_id: id2)
      if @invitation.save
        flash[:notice]= "Invitation sent successfully!"
        redirect_to users_path
      else
        flash[:error] = "Error!"
      end
    end
  
    def destroy
      invitation = Invitation.find(params[:invitation_id])
      invitation.destroy
      redirect_to user_path(current_user.id)
      # flash[:notice]= "Unsent successfully!"
    end
  
    def update
      invitation = Invitation.find(params[:invitation_id])
      p current_user
      invitation.update(confirmed: true)
      redirect_to user_path(invitation.friend_id)
    end

    def unsent
      invitation = Invitation.find(params[:invitation_id])
      invitation.destroy
      redirect_to show_user_panel_path(current_user.id)
    end
    
  end