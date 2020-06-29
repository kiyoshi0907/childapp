class ApplicationController < ActionController::Base
  
  def counts(user)
    @count_followings = user.followings.count
    @count_followers = user.followers.count
  end
  
  include SessionsHelper
    
  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
end
