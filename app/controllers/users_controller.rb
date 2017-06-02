class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.admin = true if params[:user][:admin] = 1
    @user.save
    session[:user_id] = @user.id
    redirect_to @user
  end

  def show
    if !logged_in?
      redirect_to root_path, alert: "Access Forbidden."
    end
  end
  # {"utf8"=>"✓", "authenticity_token"=>"QhI6e50oQHd4YEeNGg3tYdDbAh11SY6wcExDvr5oMP+mSiu5EH3ZBVO7giNorPNA6FUOq5K1cdaut1UQRgfl2g==",
  #   "user"=>{"name"=>"Hima", "password"=>"password", "height"=>"43",
  #   "happiness"=>"2", "nausea"=>"3", "tickets"=>"23", "admin"=>"1"}, "commit"=>"Create User", "controller"=>"users", "action"=>"create"}

  private

  def user_params
    params.required(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end
end
