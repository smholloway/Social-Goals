class Goal < ActiveRecord::Base
  belongs_to  :user
  has_many    :tasks, :dependent => :destroy
  
  attr_accessible :name, :description, :public
  attr_protected  :user_id
  attr_readonly   :created_at
  
  validates_presence_of :name, :user_id
  validates_associated  :user
  
  def self.most_recent(limit_amount=5, public_only=true)
    return self.all(:conditions => ["public = ?", public_only],
                    :limit => limit_amount, :order => "created_at DESC")
  end
  
  # anyone can view public goals; owner can view their own public/private goals
  def view_authorized(current_user)
    return self.public? || self.edit_authorized(current_user)
  end
  
  # only owner can edit their own goals
  def edit_authorized(current_user)
    return self.user_id == current_user.id
  end
  
end
