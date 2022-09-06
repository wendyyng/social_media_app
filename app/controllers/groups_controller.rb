class GroupsController < ApplicationController
  before_action :find_group, only: [:show, :edit, :update]
  before_action :authorize_user!, only: [:edit, :update]
  before_action :authenticate_user!
  
    def index
        @groups = Group.order(created_at: :desc)
    end

    def show
        @group_post = GroupPost.new
        @comment = Comment.new
        @members = Membership.where(group: @group)
        @comment.group_post = @group_post
        @group_posts = @group.group_posts.order(created_at: :desc)
        @distance = group_user_distance_km(@group, current_user)
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

    def edit
      
    end

    def update
     
        if @group.update(group_params)
            redirect_to group_path(@group)
         else
          render :edit
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
        params.require(:group).permit(:title, :description, :img_url, :address)
    end

    def group_user_distance_km(group, user)
      if group.longitude && user.longitude
        rkm = 6371; #Radius of the earth in km
        rad_per_deg = Math::PI/180  # PI / 180
  
        glon = group.longitude
        glat = group.latitude
        ulon = user.longitude
        ulat = user.latitude
  
        # first add our own radians function since Ruby Math does not have one
        radians = -> (degrees) { degrees * (Math::PI / 180)}
  
        # convert latitude degrees to radians
        phi_1 = glat * rad_per_deg;
        phi_2 = ulat * rad_per_deg;
  
        # delta being the "difference" between the latitudes and longitudes of each coordinate set expressed
        # in radians
        delta_phi = radians.call(ulat - glat);
        delta_lambda = radians.call(ulon - glon);
  
        # sin²(φB - φA/2) + cos φA * cos φB * sin²(λB - λA/2)
        a = Math.sin(delta_phi/2.0)**2 + Math.cos(phi_1) * Math.cos(phi_2) * Math.sin(delta_lambda/2.0)**2;
  
        # 2 * atan2( √a, √(1−a) )
        c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
  
        kilometers = (rkm * c).round(2)

      end
      
    end

end
