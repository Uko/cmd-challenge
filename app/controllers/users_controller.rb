class UsersController < ApplicationController
  def get_users
    users = User.find(:all, :select => 'email', :conditions => ['lower(email) LIKE ?', "%#{params[:str_to_complete]}%"])
    
    @user_emails = users.map{|user| user.email}
    
    render :json => @user_emails
  end
end
