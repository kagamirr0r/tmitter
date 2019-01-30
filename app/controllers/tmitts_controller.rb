class TmittsController < ApplicationController
  def create
    @tmitt = current_user.tmitts.build(tmitt_params)
    if @tmitt.save
      flash[:success] = 'メッセージを投稿しました'
      redirect_to root_url
    else
      flash[:danger]
      render 'toppages/index'
    end
  end

  def destroy
    @tmitt.destroy
    flash[:danger] = 'メッセージを削除しました'
  　redirect_back(fallback_loccation: root_url)
  end
  
  private
  
  def tmitt_params
   params.require(:tmitt).permit(:content)  
  end
end
