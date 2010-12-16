class AchievementType < ActiveRecord::Base  
  has_many :levels
  
  validates_presence_of :name
end
