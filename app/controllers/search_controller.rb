class SearchController < ApplicationController
  before_action :authenticate_user!
  
  def index

    @keyword = params[:q].values[0]
      if @keyword.length > 0
        @groups = @query.result(distinct: true)
        @query = Group.ransack(params[:q])
      else
        redirect_to groups_path
      end
    end
end
