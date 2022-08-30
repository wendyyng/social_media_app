class GroupsController < ApplicationController
    def index
        @groups = Group.order(created_at: :desc)
    end

    def show
        @group = Group.find params[:id]
        @group_post = GroupPost.new
        @group_posts = @group.group_posts.order(created_at: :desc)
    end

end
