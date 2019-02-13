class FavoritesController < ApplicationController
  def create
    tmitt = Tmitt.find(params[:id])
    current_user.likes(tmitt)
    flash[:success] = "Like!"
    redirect_to user
  end

  def destroy
    tmitt = Tmitt.find(params[:id])
    current_user.cancel_like(tmitt)
    flash[:danger] = "Canceled Like"
    redirect_to user
  end
end
