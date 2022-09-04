class WelcomeController < ApplicationController
    def index
        @user_count = User.all.count
        @group_count = Group.all.count
        @comment_count = Comment.all.count

    end
end