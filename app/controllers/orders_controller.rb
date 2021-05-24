class OrdersController < ApplicationController
  def index
  end


  def new
    Order.new
  end

  def create
    Order.new()
  end
  
  private

  def order_params
    params.require(:categories).permit(:id, :name, :description, :query)
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
