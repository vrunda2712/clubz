class SessionsController < ApplicationController

  def new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to(:clubs, notice: 'Login successful')
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    flash[:alert] = "Logged out."
    redirect_to(:clubs, notice: 'Logged out!')
  end

end
