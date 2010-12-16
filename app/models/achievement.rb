class Achievement < ActiveRecord::Base
  belongs_to :user
  belongs_to :level
  
  validates_presence_of :user_id, :level_id
  validates_associated :user, :level
end
