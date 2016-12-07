class HomeController < ApplicationController

  def index
    @user = User.new
  end

  def go_to_chat
    user_params = {
      :name => params[:user][:username],
      :email => params[:user][:email],
      :role_id => params[:user][:role_id].to_i
    }
    @user = User.find_or_create_by(user_params)
    if @user.valid?
      redirect_to @user.is_employee? ? employee_chat_user_path(@user) : user_chat_user_path(@user)
    else
      @user = User.new(user_params)
      @user.valid?
      render :index
    end
  end

end
