class HomeController < ApplicationController
  def index
    @goals = Goal.most_recent(5, true) # retrieve the 5 most recent public goals
  end

end
