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
  
  # anyone can view public achievmenents; owner can view their own public/private achievements
  def view_authorized(current_user)
    return self.public? || self.edit_authorized(current_user)
  end
  
  # only owner can edit their own achievements
  def edit_authorized(current_user)
    return self.user_id == current_user.id
  end
  
end
