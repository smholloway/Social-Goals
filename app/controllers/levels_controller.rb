class LevelsController < ApplicationController
  
  def index
    redirect_to achievement_types_url # no really good reason to show all levels here
  end
  
  def show
    @level = Level.find_by_id(params[:id])
    redirect_to achievement_types_url and return if @level.nil?
    
    respond_to do |format|
      format.html
    end
  end
  
  def edit
    redirect_to levels_url and return if !admin_signed_in?
    @level = Level.find_by_id(params[:id])
  end
  
  def create
    redirect_to levels_url and return if !admin_signed_in?
    @achievement_type = AchievementType.find(params[:achievement_type_id])
    @level = @achievement_type.levels.new(params[:level])
        
    respond_to do |format|
      if @level.save
        format.html { redirect_to(@achievement_type, :notice => 'Level was successfully created.') }
      else
        format.html { render :template => "achievement_types/show" }
      end
    end
  end
  
  def update
    redirect_to levels_url and return if !admin_signed_in?
    @level = Level.find_by_id(params[:id])
    
    respond_to do |format|
      if @level.update_attributes(params[:level])
        format.html { redirect_to(@level, :notice => 'Level was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
  def destroy
    redirect_to levels_url and return if !admin_signed_in?
    @level = Level.find_by_id(params[:id])
    @level.destroy
    
    respond_to do |format|
      format.html { redirect_to(@level.achievement_type, :notice => 'Level was successfully deleted.') }
    end
  end
end
