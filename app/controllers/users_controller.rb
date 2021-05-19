class UsersController < ApplicationController
  
  def edit
  end

  def update
  end

  private

  def category_params
    params.require(:user).permit(:first_name, :last_name, :address)
  end

  def set_category
    @user = current_user
  end
end
