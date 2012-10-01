class Task < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :collaborators, :class_name => "User", :uniq => true
  
  attr_accessible :description, :title
  
  validates_presence_of :user, :description, :title
end
