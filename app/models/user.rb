class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :recoverable
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable
  
  has_many :tasks, :dependent => :destroy, :order => 'updated_at DESC'
  has_and_belongs_to_many :shared_tasks, :class_name => 'Task', :order => "updated_at DESC"

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
end
