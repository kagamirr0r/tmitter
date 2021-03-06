class UsersController < ApplicationController
before_action :require_user_logged_in, only:[:index, :show, :followings, :followers]
before_action :find_user, only:[:show, :edit, :followings, :followers, :like]
  def index
    @users = User.all.page(params[:page])
  end

  def show
   # @user = User.find(params[:id])
    @tmitts = @user.tmitts.order('created_at DESC').page(params[:page])
    counts(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "ユーザーを登録しました"
      redirect_to @user
    else
      flash[:dange] = "ユーザー登録に失敗しました"
      render :new
    end
  end
  
  def edit
   # @user = User.find(params[:id])
  end
  
  def followings
    #@user = User.find(params[:id])
    @followings = @user.followings.page(params[:page])
    counts(@user)
  end
  
  def followers
    #@user = User.find(params[:id])
    @followers = @user.followers.page(params[:page])
    counts(@user)
  end
  
  def like
   #@user = User.find(params[:id])
   @likes = @user.likes.page(params[:page])
   counts(@user)
  end
  
  private
  
  def user_params
   params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def find_user
    @user = User.find(params[:id])
  end
end
