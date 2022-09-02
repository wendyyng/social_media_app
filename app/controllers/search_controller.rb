class SearchController < ApplicationController
  before_action :authenticate_user!
  
  def index

    @keyword = params[:q].values[0]
    @query = Group.ransack(params[:q])
    @groups = @query.result(distinct: true)
  end

end
