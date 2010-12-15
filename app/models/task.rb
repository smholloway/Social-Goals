class Task < ActiveRecord::Base
  #attr_accessor :name, :description, :deadline, :percent_complete, :public
  
  validates_presence_of :name
  validates_associated :goal
  validates_inclusion_of :percent_complete, :in => 0..100, :message => "can only be integer values between 0 and 100."
  
  belongs_to  :goal
  # circular reference relationship below
  belongs_to  :parent,
              :foreign_key => "parent_id",
              :class_name => "Task"
  has_many    :children,
              :foreign_key => 'parent_id',
              :class_name => 'Task',
              :dependent => :delete_all
end
