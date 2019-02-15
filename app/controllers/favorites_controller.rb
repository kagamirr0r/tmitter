class FavoritesController < ApplicationController
before_action :require_user_logged_in

  def create
    tmitt = Tmitt.find(params[:tmitt_id])
    current_user.like(tmitt)
    flash[:success] = "Like!"
    redirect_back(fallback_location: root_url)
  end

  def destroy
    tmitt = Tmitt.find(params[:tmitt_id])
    current_user.cancel_like(tmitt)
    flash[:danger] = "Canceled Like"
    redirect_back(fallback_location: root_url)
  end
end
