class HomeController < ApplicationController
  def index
    @goals = Goal.most_recent(5, true) # retrieve the 5 most recent public goals
  end
  
  def search
    page = params[:page] || 1
    if params[:search] && !params[:search].empty?
      search_condition = "%" + params[:search].upcase + "%"
      @search_result_goals = Goal.paginate :page => page, :order => 'name', :conditions => ['UPPER(name) LIKE ? and public = ?', search_condition, true], :per_page => 10
    else
      @search_result_goals = nil
    end
  end
  
end
