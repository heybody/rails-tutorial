class SessionsController < ApplicationController
  def new
  end
  
  def create 
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      flash.now[:success] = 'login successful' 
      log_in(user)
      remember(user)
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'   
      render 'new'
    end
  end
  
  def destroy
    flash.now[:success] = '退出成功'
    log_out
    redirect_to root_path
  end
end
