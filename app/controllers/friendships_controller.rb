class FriendshipsController < ApplicationController
    def create
        @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
        if @friendship.save
          flash[:notice] = "Added friend."
          redirect_to root_url
        else
          flash[:error] = "Error occurred!!"
          redirect_to root_url
        end
      end
      
    def destroy
     @friendship = current_user.friendships.where(friend_id: user.id)
     @friendship.destroy
     flash[:notice] = "Unfriended Successfully."
     redirect_to root_url
    end

end
