class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @categories = Category.all
  end

  def show
    @services = Services.find(params[:category_id])
  end

  private

  def category_params
    params.require(:categories).permit(:name, :description)
  end 
end
