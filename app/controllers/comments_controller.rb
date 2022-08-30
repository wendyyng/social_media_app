class CommentsController < ApplicationController
    def new

    end

    def create
        @group = Group.find params[:group_id]
        @group_post = GroupPost.find params[:group_post_id]
        @comment = Comment.new(params.require(:comment).permit(:body))
        @comment.group_post = @group_post
        @comment.user = current_user
        if @comment.save
            redirect_to group_path(@group)
          else
            render '/groups/show'
          end
    end
end
