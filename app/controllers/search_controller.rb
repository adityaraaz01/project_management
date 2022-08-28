class SearchController < ApplicationController
  def index
    if logged_in?
      @query = Feature.ransack(params[:q])
      @features = @query.result(distinct: true)
    else
      redirect_to login_path
    end
  end
end
