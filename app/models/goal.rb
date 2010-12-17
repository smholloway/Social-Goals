class Goal < ActiveRecord::Base
  belongs_to  :user
  has_many    :tasks
  
  validates_presence_of :name, :user_id
  validates_associated  :user
end
