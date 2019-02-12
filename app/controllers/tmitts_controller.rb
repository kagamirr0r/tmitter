class TmittsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
    @tmitt = current_user.tmitts.build(tmitt_params)
    if @tmitt.save
      flash[:success] = 'メッセージを投稿しました'
      redirect_to root_url
    else
      @tmitts = current_user.feed_tmitts.order('created_at DESC').page(params[:page])
      flash[:danger]
      render 'toppages/index'
    end
  end

  def destroy
    @tmitt.destroy
    flash[:danger] = 'メッセージを削除しました'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def tmitt_params
   params.require(:tmitt).permit(:content, :image)  
  end
  
  def correct_user
   @tmitt = current_user.tmitts.find_by(id: params[:id])
   unless @tmitt
    redirect_to root_url
   end
  end
end
