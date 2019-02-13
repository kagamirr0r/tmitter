class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper
  
  private
  
  def require_user_logged_in
   unless logged_in?
    redirect_to login_url
   end
  end
  
  def counts(user, tmitt)
   @count_tmitts = user.tmitts.count
   @count_followings = user.followings.count
   @count_followers = user.followers.count
   @count_likes = user.likes.count
   @count_liked = tmitt.liked.count
  end
     
end
