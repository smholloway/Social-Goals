class AchievementType < ActiveRecord::Base  
  has_many :levels, :dependent => :destroy
  
  attr_accessible :name, :description, :icon_url
  attr_protected  :visible, :active
  attr_readonly   :created_at
  
  validates_presence_of :name
end
