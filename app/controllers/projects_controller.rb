class ProjectsController < ApplicationController
  def index
    if logged_in?
		  @projects= Project.all
      @project = Project.new
      
    else
      redirect_to login_path
    end
  end


  def show
    if logged_in?
      @project = Project.find_by_id(params[:id])
      @pro_id = params[:id]
      @feature = Feature.new
      @fp_id = params[:project_id]
      @task = Task.new
      @tasks = Task.all
      @features = Feature.where(project_id: @pro_id)
      @feature_idd = Feature.find_by_id(params[:id])
    else
      redirect_to login_path
    end
	end

  def currentiteration
    if logged_in?
      @project = Project.find_by_id(params[:id])
      @pro_id = params[:id]
      @feature = Feature.new
      @task = Task.new
      @tasks = Task.all
      @features = Feature.where(project_id: @pro_id)
      @feature_idd = Feature.find_by_id(params[:id])
    
    else
      redirect_to login_path
    end
	end

  def backlog
    if logged_in?
      @project = Project.find_by_id(params[:id])
      @pro_id = params[:id]
      @feature = Feature.new
        @feature_idd = Feature.find_by_id(params[:id])
        @fp_id = params[:project_id]
      @task = Task.new
      @tasks = Task.all
      @features = Feature.where(project_id: @pro_id)
    
    else
      redirect_to login_path
    end
	end

  def icebox
    if logged_in?
      @project = Project.find_by_id(params[:id])
      @pro_id = params[:id]
      @feature = Feature.new
        @feature_idd = Feature.find_by_id(params[:id])
        @fp_id = params[:project_id]
      @task = Task.new
      @tasks = Task.all
      @features = Feature.where(project_id: @pro_id)
    
    else
      redirect_to login_path
    end
	end

	def new
    if logged_in?
		  @project = Project.new
        @pro_id = params[:id]
    else
      redirect_to login_path
    end
	end

	def create
		 @project= Project.new(project_params)
		 if @project.save
      flash[:success] = "Project Created!"
  		redirect_to projects_path
  	else
  			render 'new'
  	end
	end

  def destroy
    @pro = Project.find_by_id(params[:id])
    @f_d = Feature.where(:project_id => @pro.id)
    @project_access = Access.where(:project_id => @pro.id)
    @project_access.each do |i|
      i.destroy
    end
    @f_d.each do |i|
      @t_d = Task.where(:feature_id => i.id)
      @t_d.each do |k|
        @c_d = Comment.where(:task_id => k.id)
        @c_d.each do |c|
          c.destroy
        end
        k.destroy  
      end
      i.destroy  
    end
    @pro.destroy
    flash[:success] = "Project deleted!"
    redirect_to projects_path
  end

 private

  def project_params
  	params.require(:project).permit(:name, :manager_name)
  end
end
