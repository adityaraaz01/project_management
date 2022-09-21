class AccessesController < ApplicationController
  def create
      @access = Access.new(access_params)
      if @access.save
        flash[:success] = "Project Assigned!"
        redirect_to request.referrer
      else
        flash[:message] = "Already"
        render 'projects/index'
      end
  end
  def destroy
    @fea = Access.find_by_id(params[:id])
    @fea.destroy
    flash[:success] = "Ac deleted"
    redirect_to projects_path, :notice => "Ac deleted"
  end

  private

  def access_params
    params.require(:access).permit(:project_id, :user_id)
  end
end
