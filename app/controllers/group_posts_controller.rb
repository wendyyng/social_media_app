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
            flash[:notice]= "Group created successfully!"
            redirect_to group_path(@group)
        else
            @group_posts = @group.group_posts.order(created_at: :desc)
            render '/groups/show', status: 303
        end
    end
end
