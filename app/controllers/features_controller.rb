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
      @feature = Feature.find_by_id(params[:id])
      @tasks = Task.all
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

  def document
    @feature = Feature.find_by_id(params[:id])
    if @feature.update(document_params)
      flash[:success] = "File uploaded"
    else
      flash[:alert] = "Something went wrong"
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def feature_params
    params.require(:feature).permit(:Title, :Description, :Category, :project_id)
  end

  def document_params
    params.require(:feature).permit(documents: [])
  end

end
