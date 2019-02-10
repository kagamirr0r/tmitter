class ToppagesController < ApplicationController
  before_action :require_user_logged_in, only:[:index]
  def index
    if logged_in?
      @tmitt = current_user.tmitts.build  # form_for 用
      @tmitts = current_user.feed_tmitts.order('created_at DESC').page(params[:page])
    end
  end
end