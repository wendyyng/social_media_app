class PostsController < ApplicationController
    before_action :authenticate_user!

    def new
        @group_post = GroupPost.new
    end

    def create
        @post = Post.new(post_params)
        @post.user = current_user
        if @post.save
            redirect_to user_path(current_user)
        else
            flash[:error] = "Invalid Group"
            render :new
        end
    end

    def edit

    end

    def update
        if @post.update(post_params)
            redirect_to product_path(@product.id)
          else
            render :edit
        end
    end

    def change_hidden_status
        @post.update(hidden: !@post.hidden)
        if @post.update
            redirect_to user_path(current_user)
        end
    end

    private

    def post_params
        params.require(:post).permit(:title, :description)
    end

end
