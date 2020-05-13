class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :current_user_show, only:[:show]
  def show
    @user = User.find(params[:id])
    @card = CreditCard.find_by(user_id: current_user.id)
  end

  def destroy
  end

  private

  def current_user_show
    if current_user.id  != params[:id].to_i 
      redirect_to root_path
    end
  end
end