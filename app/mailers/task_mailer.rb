class TaskMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.task_mailer.task_assigned.subject
  #
  def task_assigned()
    @user_id = params[:user_id]
    @task = params[:task]
    @greeting = "Hi"
    @req_email = User.find_by(id: params[:user_id]).email
    mail(
      from: "projectmanagement@support.com",
      to: @req_email,
      subject: "New Task assigned"
    ) 
  end
end
