class FeedbackMailer < ApplicationMailer
  def send_feedback(feedback)
    @user = feedback.user
    @content = feedback.content

    mail to: Admin.pluck(:email).join(',')
  end
end
