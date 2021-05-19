class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_category, only: %i[show]

  def index
    @categories = Category.all
    @suppliers = Supplier.all
  end

  def show
  end

  private

  def category_params
    params.require(:categories).permit(:id, :name, :description)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
