class AchievementsController < ApplicationController
  before_filter :authenticate_user! # must be logged in to use controller
  
  def index
    @achievements = Achievement.where(:user_id => current_user.id) # get all achievements for this user
    
    respond_to do |format|
      format.html
    end
  end
  
  def show
    @achievement = Achievement.find_by_id(params[:id])
    redirect_to achievements_url and return if @achievement.nil? or 
      !@achievement.view_authorized(current_user)
    
    respond_to do |format|
      format.html
    end
  end
  
  def edit
    @achievement = Achievement.find_by_id(params[:id])
    redirect_to achievements_url and return if @achievement.nil? or 
      !@achievement.edit_authorized(current_user)
  end
  
  def create
    @achievement = current_user.achievements.new(:level_id => params[:id])
    
    respond_to do |format|
      if @achievement.save
        format.html { redirect_to(@achievement, :notice => 'Achievement was successfully created.') }
      else
        format.html { redirect_to(achievements_url, :notice => 'Unable to claim achievement.') }
      end
    end
  end
  
  def update
    @achievement = Achievement.find_by_id(params[:id])
    redirect_to achievements_url and return if @achievement.nil? or 
      !@achievement.edit_authorized(current_user)
    
    respond_to do |format|
      if @achievement.update_attributes(params[:achievement])
        format.html { redirect_to(@achievement, :notice => 'Achievement was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
  def destroy
    @achievement = Achievement.find_by_id(params[:id])
    redirect_to achievements_url and return if @achievement.nil? or 
      !@achievement.edit_authorized(current_user)
    
    @achievement.destroy
    
    respond_to do |format|
      format.html { redirect_to(achievements_url) }
    end
  end
  
end
