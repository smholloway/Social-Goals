class AchievementType < ActiveRecord::Base  
  has_many :levels, :dependent => :destroy
  
  validates_presence_of :name
end
