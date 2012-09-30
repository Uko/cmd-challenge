require 'spec_helper'

describe UsersController do
  describe 'get_users' do
    
    it 'should return users' do
      user1 = FactoryGirl.create(:user, email: 'aaa@e.mail')
      user2 = FactoryGirl.create(:user, email: 'aab@e.mail')
      user3 = FactoryGirl.create(:user, email: 'abb@e.mail')
      user4 = FactoryGirl.create(:user, email: 'bbb@e.mail')
      
      get :get_users, :str_to_complete => 'ab'
      
      assigns(:user_emails).should match_array([user2.email, user3.email])
    end
    
  end
end
