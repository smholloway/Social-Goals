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
end
