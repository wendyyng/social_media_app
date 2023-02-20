class GroupPostsController < ApplicationController
    before_action :authenticate_user!
    def new
        @group_post = GroupPost.new
    end

    def create
        @group = Group.find params[:group_id]
        @group_post = GroupPost.new(params.require(:group_post).permit(:body, :image))
        @group_post.user = current_user
        @group_post.group = @group
        if @group_post.save
            flash[:notice]= "Group post created successfully!" 
        else
            @group_posts = @group.group_posts.order(created_at: :desc)
            flash[:error] = "Invalid Group Post"
        end
        redirect_to group_path(@group)
    end
end
