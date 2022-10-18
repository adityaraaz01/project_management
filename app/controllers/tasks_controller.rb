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
      flash[:success] = "Task created!"
      redirect_to request.referrer
    else
      render 'projects/index'
    end
  end

  def show
    @task = Task.find_by_id(params[:id])
  end
  
  def destroy
  end

  def edit
    @task = Task.find(params[:id])
    render :edit
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(params.require(:task).permit(:content, :status))
      flash[:success] = "Task item successfully updated!"
      redirect_to request.referrer
    else
      flash.now[:error] = "Task item update failed"
      render :edit
    end
  end

  def status
    @task = Task.find(params[:id])
    @task.update_attribute(:status, params[:status])
    redirect_back(fallback_location: root_path, flash: { notice: "Task status updated" })
  end

  def done
    @task = Task.find(params[:id])
    if @task.update_attribute(:done, params[:Done])
      redirect_to request.referrer
    else
      flash.now[:error] = "Done failed"
    end
  end

  def user_id
    @task = Task.find(params[:id])
    if @task.update_attribute(:user_id, params[:user_id])
      @user_r = params[:user_id]
      TaskMailer.with(user_id: @user_r, task: @task).task_assigned.deliver_now
      flash[:success] = "Member Assigned and Email sent."
      redirect_to request.referrer
    else
      flash.now[:error] = "Member Not Assigned"
    end
  end

  private

  def task_params
    params.require(:task).permit(:content, :status, :feature_id)
  end
end
