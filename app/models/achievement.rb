class Achievement < ActiveRecord::Base
  belongs_to :user
  belongs_to :level
  
  validates_presence_of :user_id, :level_id
  validates_associated  :user, :level
  validate :must_be_active

  def must_be_active
    errors.add_to_base("This achievement is not active") unless level.achievement_type.active
  end
end
