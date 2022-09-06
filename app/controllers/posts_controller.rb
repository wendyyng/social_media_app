class PostsController < ApplicationController
    before_action :authenticate_user!

    def new
        @post = Post.new
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
        @user = current_user
        @post = Post.new(post_params)
    end

    def update
        if @post.update(post_params)
            redirect_to product_path(@product.id)
          else
            render :edit
        end
    end

    private

    def post_params
        params.require(:post).permit(:title, :description, :image)
    end

end
