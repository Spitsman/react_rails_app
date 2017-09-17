class Admin::Requests::AnswersController < Admin::BaseController

  helper_method :resource_answer, :resource_request

  def create
    if resource_answer.save
      UserMailer.answer_notification(resource_request, current_user).deliver
      flash[:success] = "Email notification was sent to client"
      redirect_to admin_path
    else
      render action: :edit
    end
  end

  def edit
  end

  def update
    if resource_answer.save
      redirect_to admin_path
    else
      render action: :edit
    end
  end

  protected

  def resource_answer
    if resource_request.answer.present?
      resource_request.answer
    else
      resource_request.build_answer(params.fetch(:answer, {}).permit(:body))
      resource_answer.user = current_user
      resource_answer
    end
  end

  def resource_request
    @resource_request ||= Request.find(params[:request_id])
  end

end