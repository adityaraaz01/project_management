module ProjectsHelper
  def current_project
    @current_project = Project.find_by_id(params[:id])
  end
end
