class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @card = CreditCard.find_by(user_id: current_user.id)
  end

  def destroy
  end
end