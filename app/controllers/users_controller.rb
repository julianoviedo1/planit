class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update]

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = "#{@user.full_name} ha sido actualizado."
      redirect_to '/'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :address, :phone_number)
  end

  def set_user
    @user = current_user
  end
end
