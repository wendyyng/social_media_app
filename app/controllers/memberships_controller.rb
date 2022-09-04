class MembershipsController < ApplicationController
    before_action :authenticate_user!
    def create
        group = Group.find(params[:group_id])
        membership = Membership.new(user:current_user, group: group)
        if membership.save
            flash[:notice] = "Congrats, you have joined the group!"
         else
             flash[:alert] = membership.errors.full_messages.join(', ')
        end
        redirect_to group_path(group)
    end

    def destroy
        membership = Membership.find(params[:id])
        if membership.destroy
            flash[:notice] = "Left group!"
        else
            flash[:alert] = membership.errors.full_messages.join(', ')
        end
        redirect_to group_path(membership.group)
    end
end
