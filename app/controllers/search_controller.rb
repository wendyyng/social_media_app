class SearchController < ApplicationController
  def index
    if @keyword
      @keyword = params[:q].values[0]
    end
    @query = Group.ransack(params[:q])
    @groups = @query.result(distinct: true)
  end


end
