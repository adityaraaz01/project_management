class TasksController < ApplicationController
  def index
    if logged_in?
		  @tasks= Task.all
    else
      redirect_to login_path
    end
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "task created!"
      redirect_to request.referrer
    else
      render 'projects/index'
    end
  end

  def destroy
  end

  private

  def task_params
    params.require(:task).permit(:content, :status, :feature_id)
  end
end
