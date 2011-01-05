class HomeController < ApplicationController
  def index
    @goals = Goal.most_recent(5, true) # retrieve the 5 most recent public goals
  end
  
  def search
    search_condition = "%" + params[:search] + "%"
    @search_result_goals = Goal.find(:all, :conditions => ['name LIKE ? and public = ?', search_condition, true])
  end
  
end
