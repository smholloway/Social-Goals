class Level < ActiveRecord::Base  
  belongs_to  :achievement_type
  has_many    :achievements, :dependent => :destroy # to find users who have achieved this level
  
  attr_accessible :name, :description, :point_value
  attr_protected  :achievement_type_id, :visible
  attr_readonly   :created_at
  
  validates_presence_of :name, :achievement_type_id
  validates_associated  :achievement_type
  validates_uniqueness_of :point_value, :scope => :achievement_type_id # each level must have different point values
end
