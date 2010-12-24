class Achievement < ActiveRecord::Base
  belongs_to :user
  belongs_to :level
  
  attr_accessible :public
  attr_protected  :user_id, :level_id
  attr_readonly   :created_at
  
  validates_presence_of   :user_id, :level_id
  validates_associated    :user, :level
  validates_uniqueness_of :user_id, :scope => :level_id # prevents duplicate achievements
  validate :must_be_active
  
  def must_be_active
    errors.add_to_base("This achievement is not active") unless level.achievement_type.active
  end
  
  def self.most_recent(limit_amount=5, public_only=true)
    return self.all(:conditions => ["public = ?", public_only],
                    :limit => limit_amount, :order => "created_at DESC")
  end
end
