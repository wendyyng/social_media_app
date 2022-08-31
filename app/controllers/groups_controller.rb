class GroupsController < ApplicationController
    def index
        @groups = Group.order(created_at: :desc)
    end

    def show
        @group = Group.find params[:id]
        @group_post = GroupPost.new
        @comment = Comment.new
        @members = Membership.where(group: @group)
        @comment.group_post = @group_post
        @group_posts = @group.group_posts.order(created_at: :desc)
        if current_user
          @membership = current_user.memberships.find_by(group: @group) 
        end
    end

    def new
        @group = Group.new
    end

    def create
        @group = Group.new(group_params)
        @group.user = current_user
        @member = Membership.new
        @member = Membership.create(user:current_user, group: @group)
        if @group.save
          flash[:notice]= "Group created successfully!"
          redirect_to group_path(@group.id), notice: "Created"
        else
          flash[:error] = "Invalid Group"
          render :new
        end
    end

    private

    def authorize_user!
     redirect_to root_path, alert: "Not authorized" unless can?(:crud, @product)
    end

    def find_group
      @group = Group.find params[:id]
    end

    def group_params
        params.require(:group).permit(:title, :description)
    end

end
