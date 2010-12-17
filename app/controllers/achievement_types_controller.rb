class AchievementTypesController < ApplicationController
  
  def index
    @achievement_types = AchievementType.where(:visible => true)
    
    respond_to do |format|
      format.html
    end
  end
  
  def show
    @achievement_type = AchievementType.find_by_id(params[:id])
    redirect_to achievement_types_url and return if @achievement_type.nil?
    @level = Level.new
    
    respond_to do |format|
      format.html
    end
  end
  
  def new
    redirect_to achievement_types_url and return if !admin_signed_in?
    @achievement_type = AchievementType.new
    
    respond_to do |format|
      format.html
    end
  end
  
  def edit
    redirect_to achievement_types_url and return if !admin_signed_in?
    @achievement_type = AchievementType.find_by_id(params[:id])
  end
  
  def create
    redirect_to achievement_types_url and return if !admin_signed_in?
    @achievement_type = AchievementType.new(params[:achievement_type])
    
    respond_to do |format|
      if @achievement_type.save
        format.html { redirect_to(@achievement_type, :notice => 'Achievement type was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def update
    redirect_to achievement_types_url and return if !admin_signed_in?
    @achievement_type = AchievementType.find_by_id(params[:id])
    
    respond_to do |format|
      if @achievement_type.update_attributes(params[:achievement_type])
        format.html { redirect_to(@achievement_type, :notice => 'Achievement type was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
  def destroy
    redirect_to achievement_types_url and return if !admin_signed_in?
    @achievement_type = AchievementType.find_by_id(params[:id])
    @achievement_type.levels.destroy_all
    @achievement_type.destroy
    
    respond_to do |format|
      format.html { redirect_to(achievement_types_url) }
    end
  end
end
