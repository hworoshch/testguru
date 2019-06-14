class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session[:referer]
    else
      flash.now[:alert] = 'Check your login data'
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
