class GroupPostsController < ApplicationController
    def new
        @group_post = GroupPost.new
    end

    def create
        @group = Group.find params[:group_id]
        @group_post = GroupPost.new(params.require(:group_post).permit(:body))
        @group_post.user = current_user
        @group_post.group = @group
        if @group_post.save
            redirect_to group_path(@group)
            # , notice: "Post created"
        else
            @group_posts = @group.group_posts.order(created_at: :desc)
            render '/groups/show', status: 303
        end
    end
end
