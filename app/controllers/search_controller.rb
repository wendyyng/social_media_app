class SearchController < ApplicationController
  def index

    @keyword = params[:q].values[0]
    @query = Group.ransack(params[:q])
    @groups = @query.result(distinct: true)
  end

end
