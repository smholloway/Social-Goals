class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
    # If this show page is only for the currently logged in user change it to @user = current_user
  end
  
  def profile
    @user = User.find_by_name(params[:name])
    redirect_to root_url and return if @user.nil?
    @goals = @user.goals.where(:public => true) # get all public goals for this username
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
end
