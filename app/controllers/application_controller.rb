class ApplicationController < ActionController::Base
  before_action :set_query
  include SessionsHelper
  include ProjectsHelper


  def set_query
    @query = Feature.ransack(params[:q])
  end
end
