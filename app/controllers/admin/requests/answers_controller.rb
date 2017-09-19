class Admin::Requests::AnswersController < Admin::BaseController

  helper_method :resource_answer, :resource_request

  def create
    if resource_answer.save
      deliver_emails
      flash[:success] = "Email notification was sent to client"
      redirect_to admin_path
    else
      render action: :edit
    end
  end

  def edit
  end

  def update
    if resource_answer.update_attributes(answer_params)
      redirect_to admin_path
    else
      render action: :edit
    end
  end

  protected

  def deliver_emails
    resource_request.users.each do |user|
      UserMailer.answer_notification(user, resource_request, current_user).deliver
    end
  end

  def resource_answer
    if resource_request.answer.present?
      resource_request.answer
    else
      resource_request.build_answer(answer_params)
      resource_answer.user = current_user
      resource_answer
    end
  end

  def answer_params
    params.fetch(:answer, {}).permit(:body)
  end

  def resource_request
    @resource_request ||= Request.find(params[:request_id])
  end

end