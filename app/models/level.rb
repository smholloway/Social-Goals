class Level < ActiveRecord::Base  
  belongs_to  :achievement_type
  has_many    :achievements # to find users who have achieved this level
  
  validates_presence_of :name, :achievement_type_id
  validates_associated  :achievement_type
end
