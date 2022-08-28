class FeaturesController < ApplicationController
  def index
    if logged_in?
		  @features= Feature.all
    else
      redirect_to login_path
    end
  end

  def show
    if logged_in?
      @feature = find_by_id(params[:id])
    else
      redirect_to login_path
    end
	end


  def create
    @feature = Feature.new(feature_params)
    if @feature.save
      flash[:success] = "feature created!"
      redirect_to request.referrer
    else
      render 'projects/index'
    end
  end

  def destroy
    @fea = Feature.find_by_id(params[:id])
    @t_d = Task.where(:feature_id => @fea.id)
    @t_d.each do |i|
      i.destroy  
    end
    @fea.destroy
    flash[:success] = "feature deleted"
    redirect_to projects_path, :notice => "feature deleted"
  end

  private

  def feature_params
    params.require(:feature).permit(:Title, :Description, :Category, :project_id)
  end
end
