class LikesController < ApplicationController
    before_action :authenticate_user!
    def create
        group_post = GroupPost.find(params[:group_post_id])
        group = group_post.group
            like = Like.new(user:current_user, group_post: group_post)
            if like.save
                flash[:notice] = "Group post has been liked"
            else
                flash[:alert] = like.errors.full_messages.join(', ')
            end
            redirect_to group_path(group)
    end

    def destroy
        like = Like.find(params[:id])
        group = like.group_post.group
        if like.destroy
            flash[:notice] = "Group post unliked"
        else
            flash[:alert] = like.errors.full_messages.join(', ')
        end
        redirect_to group_path(group)
    end
end
