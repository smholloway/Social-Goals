class Level < ActiveRecord::Base
  #attr_accessor :name, :description, :point_value, :visible
  
  validates_presence_of :name
  validates_associated :achievement_type
  
  belongs_to :achievement_type
  has_many :achievements # to find users who have achieved this level
end
