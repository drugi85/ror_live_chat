class UsersController < ApplicationController

  before_action :find_user


  def user_chat
  end

  def employee_chat
  end

  def find_user
    @user = User.find_by(:id => params[:id].to_i)
    if @user.blank? || (params[:id]  =~ /^[0-9]+$/).blank?
      redirect_to(root_path, :alert => "User does not exist!!") and return
    end
  end

end
