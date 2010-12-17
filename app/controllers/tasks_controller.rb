class TasksController < ApplicationController
  before_filter :authenticate_user! # must be logged in to use controller
  
  def index
    redirect_to goals_url # no really good reason to show all tasks here
  end
  
  def show
    @task = Task.find_by_id(params[:id])
    redirect_to tasks_url and return if !authorized(@task)
    
    respond_to do |format|
      format.html
    end
  end
  
  def edit
    @task = Task.find_by_id(params[:id])
    redirect_to tasks_url and return if !authorized(@task)
  end
  
  def create
    @goal = Goal.find(params[:goal_id])
    @task = @goal.tasks.new(params[:task])
    @task.user_id = current_user.id
    
    respond_to do |format|
      if @task.save
        format.html { redirect_to(@goal, :notice => 'Task was successfully created.') }
      else
        format.html { render :template => "goals/show" }
      end
    end
  end
  
  def update
    @task = Task.find_by_id(params[:id])
    redirect_to tasks_url and return if !authorized(@task)
    
    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to(@task, :notice => 'Task was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
  def destroy
    @task = Task.find_by_id(params[:id])
    redirect_to tasks_url and return if !authorized(@task)
    @task.destroy
    
    respond_to do |format|
      format.html { redirect_to(@task.goal, :notice => 'Task was successfully deleted.')  }
    end
  end
  
  private
  
  def authorized(task)
    return false if task.nil? || task.user_id != current_user.id
    return true
  end
  
end
