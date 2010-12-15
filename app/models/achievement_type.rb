class AchievementType < ActiveRecord::Base
  #attr_accessor :name, :description, :icon_url, :visible, :active
  
  validates_presence_of :name
  
  has_many :levels
end
