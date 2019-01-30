class ToppagesController < ApplicationController
  def index
    if logged_in?
      @tmitt = current_user.tmitts.build  # form_for 用
      @tmitts = current_user.tmitts.order('created_at DESC').page(params[:page])
    end
  end
end