class Task < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :description, :title
  
  validates_presence_of :user, :description, :title
end
