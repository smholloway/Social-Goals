class Goal < ActiveRecord::Base
  #attr_accessor :name, :description, :public
  
  validates_presence_of :name
  
  belongs_to :user
  has_many :tasks
end
