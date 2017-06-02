class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    return head(:forbidden) unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to @user
  end

  def destroy
    session.clear
    redirect_to root_path
  end
  # {"utf8"=>"✓", "authenticity_token"=>"QhI6e50oQHd4YEeNGg3tYdDbAh11SY6wcExDvr5oMP+mSiu5EH3ZBVO7giNorPNA6FUOq5K1cdaut1UQRgfl2g==",
  #   "user"=>{"name"=>"Hima", "password"=>"password", "height"=>"43",
  #   "happiness"=>"2", "nausea"=>"3", "tickets"=>"23", "admin"=>"1"}, "commit"=>"Create User", "controller"=>"users", "action"=>"create"}

end
