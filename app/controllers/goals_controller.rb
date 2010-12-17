class GoalsController < ApplicationController
  before_filter :authenticate_user! # must be logged in to use controller
  
  def index
    @goals = Goal.where(:user_id => current_user.id) # get all goals for this user
    
    respond_to do |format|
      format.html
    end
  end
  
  def show
    @goal = Goal.find_by_id(params[:id])
    redirect_to goals_url and return if !authorized(@goal)
    @task = current_user.tasks.build(:goal_id => @goal.id)
    
    respond_to do |format|
      format.html
    end
  end
  
  def new
    @goal = current_user.goals.build
    
    respond_to do |format|
      format.html
    end
  end
  
  def edit
    @goal = Goal.find_by_id(params[:id])
    redirect_to goals_url and return if !authorized(@goal)
  end
  
  def create
    @goal = current_user.goals.new(params[:goal])
    
    respond_to do |format|
      if @goal.save
        format.html { redirect_to(@goal, :notice => 'Goal was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def update
    @goal = Goal.find_by_id(params[:id])
    redirect_to goals_url and return if !authorized(@goal)
    
    respond_to do |format|
      if @goal.update_attributes(params[:goal])
        format.html { redirect_to(@goal, :notice => 'Goal was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
  def destroy
    @goal = Goal.find_by_id(params[:id])
    redirect_to goals_url and return if !authorized(@goal)
    @goal.tasks.destroy_all
    @goal.destroy
    
    respond_to do |format|
      format.html { redirect_to goals_url }
    end
  end
  
  private
  
  def authorized(goal)
    return false if goal.nil?
    # only show hidden goals if the user owns it
    return false if !goal.public? && goal.user_id != current_user.id
    return true
  end
  
end
