class Task < ActiveRecord::Base
  belongs_to  :goal
  belongs_to  :user
  # circular reference relationship below
  belongs_to  :parent,
              :foreign_key => "parent_id",
              :class_name => "Task"
  has_many    :children,
              :foreign_key => 'parent_id',
              :class_name => 'Task',
              :dependent => :destroy
  
  validates_presence_of     :name, :percent_complete, :goal_id, :user_id
  validates_associated      :goal, :user
  validates_numericality_of :percent_complete, :only_integer => true
  validates_inclusion_of    :percent_complete, :in => 0..100, :message => "can only be integer values between 0 and 100."
end
